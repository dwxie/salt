#!/usr/bin/env python
#-*- coding:utf-8 -*-

import os,sys,time,json
from tib import funcs

#kk = open("sjz-sto1.sls").read().splitlines()

get_wwn_from_file = '''cat %s|egrep -B1 "upload_port: "|egrep wwn|awk '{print $2}'|column -t|sed "s/\'//g"'''

k1 = json.loads(open("info").read())
file_names = []
for k,v in k1.items():
    the_right_v = v['stdout'].encode("UTF-8").split(",")
    the_file = "%s.sls" % str(k).strip()
    file_wwns = funcs.get_shell_cmd_output(get_wwn_from_file % the_file)
    right_wwns = v['stdout']

    here_we_go = zip(file_wwns,the_right_v)
    #print here_we_go
    ori_content = open(the_file).read()
    the_n = ori_content.find("cos")
    result_content = ori_content[:the_n]
    second_part = ori_content[the_n:]
    for b,a in here_we_go:
        #print b,a
        second_part = second_part.replace(b,a)
    result_content += second_part
    with open("%s.t" % the_file,"w+") as f:
        f.write(result_content)
        print "write done file %s" % str(the_file)

#for i in kk:
#   print i
