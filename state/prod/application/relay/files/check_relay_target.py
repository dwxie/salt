#!/usr/bin/env python
# -*- coding:utf-8 -*-

import os,sys,time,json
from tib import funcs

ret = funcs.get_shell_cmd_output('''find /opt/ -name "config.json"|egrep sbin''')
if ret[0] != "failed":
    for file in ret:
        if os.path.exists(file):
            try:
                relay_config = json.loads(open(file).read())
                print "---------------- [%s] ----------------" % file
                if relay_config['relay_config']['target'] == []:
                    print "empty"
                else:
                    for i in relay_config['relay_config']['target']:
                        print i
            except Exception as e:
                print "some error [%s]" % str(e)



