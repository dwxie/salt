#!/usr/bin/env python
# -*- coding:utf-8 -*-

import os,json,time,sys
from tib import funcs
from tib import logs
from tib import global_vars as vars
funcs.cd_into_cwd_dir(sys.argv[0])

TIME = "%s" % vars.NOW_TIME
HOUR = "%s" % TIME.split()[1].split(":")[0]
MINUTE = "%s" % TIME.split()[1].split(":")[1]
check_log_path = '''/opt/nginx-tool/sbin/rtmp_business.log'''
log_obj = logs.log2("./check_jpg_save/check_jpg_save.log")
tail_num = 10000

f = open('/backup/logs/node_check.log','w')

try:
   if os.path.exists(check_log_path) is not True:
       log_obj.write_err("Sorry.not found the log file [%s]" % check_log_path ,2)
       f.write("over time\nPlease check log\n")
except:
   funcs.traceback_to_file(log_obj)
   f.close()
   sys.exit()

def get_the_right_time_format():
    global HOUR,MINUTE,TIME
    if int(HOUR) >= 1 and int(HOUR) <= 23:
        if int(MINUTE) == 0:
            HOUR = int(HOUR) - 1
            if len(str(HOUR)) == 1:
                HOUR = "0%s" % str(HOUR)
            MINUTE = "59"
        else:
            MINUTE = int(MINUTE) - 1
            if len(str(MINUTE)) == 1:
                MINUTE = "0%s" % str(MINUTE)
        result_time = "%sT%s:%s" % (TIME.split()[0],HOUR,MINUTE)
    else:
        if int(MINUTE) == 0:
            result_time = "%sT%s:%s" % (vars.YESTERDAY,"23","59")
        else:
            MINUTE = int(MINUTE) - 1
            if len(str(MINUTE)) == 1:
                MINUTE = "0%s" % str(MINUTE)
            HOUR = "00"
            result_time = "%sT%s:%s" % (TIME.split()[0],HOUR,MINUTE)
    return result_time

def get_reg_time_format():
    return "^\[%s" % get_the_right_time_format()

def get_the_result(check_file_path,key,num,reg_format):
    ret = funcs.run_shell_command_3('''tail -%s %s |egrep "%s"|egrep "%s"|wc -l''' % (num,check_file_path,reg_format,key))
    if ret[0] == "ok":
        l1 = ret[1]
        if int(l1[0]) == 0:
            f.write("ok\n")
            f.write("found 0 records this time\n")
            print "found 0 records this time\n"
        else:
            ret1 = funcs.run_shell_command_3('''tail -%s %s |egrep "%s"|egrep "%s"''' % (num,check_file_path,reg_format,key))
            if ret1[0] == 'ok':
                l2 = ret1[1]
                f.write("over time\n")
                f.write("found %s records this time\n" % len(l2))
                print "found %s records this time\n" % len(l2)
                for i in l2:
                    f.write('''%s\n''' % i)
                    print '''%s\n''' % i
    else:
        f.write("over time\ncheck log\n")
        print "over time \n check log\n"

get_the_result(check_log_path,"record_jpeg_upload",tail_num,get_reg_time_format())
f.close()
