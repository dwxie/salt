#!/usr/bin/env python
#coding: utf-8
#

import os,re,time
from zy_tools import Mylogging

rm_log = Mylogging('/opt/indexserver/rm_log')

def find_deadline(check_time):
    try:
        if re.search("d",check_time):
            deadline = int(time.time()) - int(check_time[:-1]) * 24 * 60 *60
        elif re.search("h",check_time):
            deadline = int(time.time()) - int(check_time[:-1]) * 60 *60
        elif re.search("m",check_time):
            deadline = int(time.time()) - int(check_time[:-1]) * 60
        elif re.search("s",check_time):
            deadline = int(time.time()) - int(check_time[:-1])
        else:
            rm_log.critical("check_time type is wrong! please input this as int+d/h/m/s")
    except ValueError as e:
        rm_log.critical("check_time type is wrong! please input this as int+d/h/m/s")
    return deadline

def remove_log(log_path,check_time = '30d'):
    deadline = find_deadline(check_time)
    log_file_list = os.listdir( log_path )
    for log_file in log_file_list:
        file_time = int(os.path.getmtime( log_path + '/' + log_file ))
        if file_time < deadline:
            os.remove( log_path + '/' + log_file )
            rm_log.info( "remove log file %s which Mtime is %s long" % ( log_file,file_time ))
        else:
            rm_log.info( "skip log file %s which Mtime is %s long" % ( log_file,file_time))

remove_log('/opt/indexserver/recovey')
remove_log('/opt/indexserver/logs')
remove_log('/data/storage_log')

