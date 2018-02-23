#!/usr/bin/env python
#-*- coding:utf-8 -*-

import sys,os,time
sys.path.insert(0,"/opt/sa_tools/scripts/py")
from tib import funcs,logs
import json
import re

funcs.cd_into_cwd_dir("/opt/sa_tools/scripts/py/dddd")
lsblk_cmd = '''lsblk -b -i  -l  -P -n -o NAME,MOUNTPOINT,SIZE,TYPE,ROTA > /tmp/lsblk_all_disk_info'''
if funcs.get_shell_cmd_output(lsblk_cmd) == "failed":
    print "Sorry..lablk exec failed"
    sys.exit()
content_list = open("/tmp/lsblk_all_disk_info").read().splitlines()
log_obj = logs.log2("free_disk")
format_script = "/opt/sa_tools/scripts/sh/manual_mkfs.sh"

def return_key(one_kv):
    return str(one_kv).split("=")[1].strip().replace('"',"").replace("'","")

def return_first(one_kv):
    return str(one_kv).split("=")[0].strip().replace('"',"").replace("'","")

def check_if_has():
    pass

def get_wwn_by_disk(disk_name):
    the_wwn_cmd = """ls -l /dev/disk/by-id/wwn-*|egrep %s|egrep -v part|awk -F'->' '{print $1}'|awk '{print $NF}'|awk -F'/' '{print $NF}'|sed 's/wwn-//'|column  -t""" % disk_name
    kk = funcs.get_shell_cmd_output(the_wwn_cmd)
    if kk != "failed" and kk != []:
        return kk[0]
    else:
        return ""

def filter_more():
    findmnt_cmd = '''findmnt -e -n -l -P -R -o SOURCE,TARGET|egrep '/dev/'|egrep -v "devpts"|column  -t > /tmp/findmnt_disk_info'''
    kk = funcs.get_shell_cmd_output(findmnt_cmd)
    if kk != "failed":
        a_1 = []
        k1 = open("/tmp/findmnt_disk_info").read().splitlines()
        for i in k1:
            dev_name = return_key(i.split()[0])
            mount_point = return_key(i.split()[1])
            if "by" in dev_name:
                t_cmd = """ls -l %s |egrep "\->"|awk '{print $NF}'""" % dev_name
                k2 = funcs.get_shell_cmd_output(t_cmd)
                if k2 != "failed" and k2 != []:
                    new_dev_name = str(re.sub("[0-9]+","",os.path.split(k2[0])[1])).strip()
                    if new_dev_name not in a_1:
                        a_1.append(new_dev_name)
            else:
                new_dev_name = str(re.sub("[0-9]+","",os.path.split(dev_name)[1])).strip()
                if new_dev_name not in a_1:
                    a_1.append(new_dev_name)
        #funcs.get_shell_cmd_output("rm %s" % "/tmp/findmnt_disk_info")
        return a_1
    else:
        return []

the_dic = {}
all_list = []
wwn_list = []

for one_line in content_list:
    t_list = []
    for item in one_line.split():
        k1 = return_key(item)
        t_list.append(k1)
    all_list.append(t_list)

for NAME,MOUNTPOINT,SIZE,TYPE,ROTA in all_list:
    SIZE = SIZE.replace('"',"").replace("'","")
    ROTA = ROTA.replace('"',"").replace("'","")
    NAME = NAME.replace('"',"").replace("'","")
    MOUNTPOINT = MOUNTPOINT.replace('"',"").replace("'","")
    TYPE = TYPE.replace('"',"").replace("'","")
    if "disk" in TYPE or "part" in TYPE:
        if funcs.hasNumbers(NAME):
            disk_name = re.sub("[0-9]+","",NAME)
            if the_dic.has_key(disk_name):
                the_dic[disk_name][NAME] = []
                the_dic[disk_name][NAME].append((str(MOUNTPOINT).strip(),int(SIZE),str(TYPE).strip(),["ssd" if int(ROTA) == 0 else "hdisk"][0]))
            else:
                the_dic[disk_name] = {}
                the_dic[disk_name][NAME] = []
                the_dic[disk_name][NAME].append((str(MOUNTPOINT).strip(),int(SIZE),str(TYPE).strip(),["ssd" if int(ROTA) == 0 else "hdisk"][0]))
        else:
            disk_name = NAME
            if the_dic.has_key(disk_name) is not True:
                the_dic[disk_name] = {}
                the_dic[disk_name]['own'] = []
                the_dic[disk_name]['own'].append((str(MOUNTPOINT).strip(),int(SIZE),str(TYPE).strip(),["ssd" if int(ROTA) == 0 else "hdisk"][0]))

free_list = []
disk_in_use_list = filter_more()
disk_in_use_list.sort()

for k,v in the_dic.items():
    jump = 0
    if v['own'][0][0] != "":
        continue
    for k1,v1 in v.items():
        if v1[0][0] != "":
            jump = 1
            break
    if jump == 1:
        continue
    else:
        if str(k).strip() not in disk_in_use_list:
            free_list.append(k)

free_list.sort()
for disk in free_list:
    log_obj.write_run("disk: %s" % disk)
    log_obj.write_run("size: %s" % funcs.human(the_dic[disk]['own'][0][1]))
    log_obj.write_run("disk type: %s" % the_dic[disk]['own'][0][3])
log_obj.write_run("\n=== Get %s disks ===" % len(free_list))

#---------------------
#print "---------------------- used list ------------------------"
#for t in disk_in_use_list:
#    print t
#print "---------------------- free list ------------------------"
#for t in free_list:
#    print t
#sys.exit()
#---------------------

if len(free_list) < 4:
    log_obj.write_run("free disk less than 4 just exit")
    print "error 1"
    sys.exit()
else:
    for the_format_disk in free_list[:4]:
        if os.path.exists(format_script):
            format_cmd = '''bash %s /dev/%s''' % (format_script,the_format_disk)
            if funcs.get_shell_cmd_output(format_cmd) != "failed":
                log_obj.write_run("Format disk [%s] successfully" % the_format_disk)
                wwn_list.append(get_wwn_by_disk(the_format_disk))
                for i in funcs.get_shell_cmd_output("lsblk /dev/%s" % the_format_disk):
                    log_obj.write_run(i)
            else:
                log_obj.write_run("Format disk [%s] failed" % the_format_disk)
                print "error 2"
                sys.exit()
print ",".join(wwn_list)

