#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import re
import time
import logging

CHECK_DIR = '/ram_data'
RM_NAME = '.h264'
CHECK_TIME = '6h'
LOG_DIR = '/backup/logs/cron_rm.log'

logging.basicConfig(level=logging.INFO,
        format='[%(asctime)s] [%(levelname)s] [%(message)s]',
        datefmt='%Y-%m-%d %H:%M:%S',
        filename=LOG_DIR,
        filemode='a')

try:
    if re.search("d",CHECK_TIME):
        deadline = int(time.time()) - int(CHECK_TIME[:-1]) * 24 * 60 *60
    elif re.search("h",CHECK_TIME):
        deadline = int(time.time()) - int(CHECK_TIME[:-1]) * 60 *60
    elif re.search("m",CHECK_TIME):
        deadline = int(time.time()) - int(CHECK_TIME[:-1]) * 60
    elif re.search("s",CHECK_TIME):
        deadline = int(time.time()) - int(CHECK_TIME[:-1])
    else:
        "CHECK_TIME type is wrong! please input this as int+d/h/m/s"
except ValueError as e:
    print "CHECK_TIME type is wrong! please input this as int+d/h/m/s"

if os.path.isdir(CHECK_DIR) and os.path.exists(CHECK_DIR):
    file_list = os.listdir(CHECK_DIR)
    for file in file_list :
        if os.path.isfile(CHECK_DIR + '/' + file):
            if re.search(RM_NAME,file):
                file_time = int(os.path.getmtime(CHECK_DIR + '/' + file))
                if file_time < deadline:
                    os.remove(CHECK_DIR + '/' + file)
                    logging.info("Has remove {dir}/{file}, is over {time}".format(dir=CHECK_DIR,file=file,time=CHECK_TIME))
