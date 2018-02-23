#!/usr/bin/env python
#

import os
import sys
from xml.etree.ElementTree import ElementTree,Element
import re

sto_file = "/root/files/storage.conf"

def run_shell_command(command_string):
	from subprocess import Popen,PIPE
	cmd = "%s" % command_string.strip()
	p = Popen(cmd,shell=True,stdout=PIPE,stderr=PIPE)
	out,err = p.communicate()
	return (p.returncode,out.rstrip(),err.rstrip())

def read_xml(file_path):
    tree = ElementTree()
    tree.parse(file_path)
    return tree

def write_xml(tree,out_path):
    tree.write(out_path,encoding='utf=8',xml_declaration=True)

def find_nodes(tree,path):
    return tree.findall(path)

def change_node_value(nodelist,text,is_add=False,is_delete=False):
    # print len(nodelist)
    for node in nodelist:
        if is_add:
            node.text += text
        elif is_delete:
            node.text = ""
        else:
            node.text = text
            #print node.text
            return node.text

def get_the_value_by_shell():
    cmd_str = 'blkid  | grep -v sda | grep ext4 | grep -v mapper | awk -F "=" "{print $2}" | awk "{print $1}"'
    ret_list = run_shell_command(cmd_str)[1].split('\n')
    uuid_part1_list = []
    uuid_part2_list = []
    uuid_part3_list = []
    for i in ret_list:
        parted_string = i.split(':')[0]
        if re.findall('1',parted_string):
            uuid_part = i.split('"')[1]
            uuid_part1_list.append(uuid_part)
        if re.findall('2',parted_string):
            uuid_part = i.split('"')[1]
            uuid_part2_list.append(uuid_part)
        if re.findall('3',parted_string):
            uuid_part = i.split('"')[1]
            uuid_part3_list.append(uuid_part)
    #print { 'part1': uuid_part1_list, 'part2': uuid_part2_list, 'part3': uuid_part3_list }
    return { 'part1': uuid_part1_list, 'part2': uuid_part2_list, 'part3': uuid_part3_list }

if __name__ == "__main__":

    tree = read_xml(sto_file)
    nodelist_part1 = find_nodes(tree,'partitions/partition/index_backup_partition_name')
    # print type(nodelist_part1)
    nodelist_part2 = find_nodes(tree,'partitions/partition/index_partition_name')
    nodelist_part3 = find_nodes(tree,'partitions/partition/data_partition_name')
    retval = get_the_value_by_shell()
    # get_the_value_by_shell()
    for k,v_list_uuid in retval.items():
        # print k
        if k == 'part1':
            for i in range(len(v_list_uuid)):
                uuid = v_list_uuid[i]
                alist = nodelist_part1[i:i+1:]
                change_node_value(alist,'/dev/disk/by-uuid/'+uuid)
        if k == 'part2':
            for i in range(len(v_list_uuid)):
                uuid = v_list_uuid[i]
                alist = nodelist_part2[i:i+1:]
                change_node_value(alist,'/dev/disk/by-uuid/'+uuid)
        if k == 'part3':
            for i in range(len(v_list_uuid)):
                uuid = v_list_uuid[i]
                alist = nodelist_part3[i:i+1:]
                change_node_value(alist,'/dev/disk/by-uuid/'+uuid)

    write_xml(tree,'/root/files/storage.conf.new')

# dev_list = run_shell_command('blkid  | grep -v sda | grep ext4 | grep -v mapper | awk -F "=" "{print $2}" | awk "{print $1}" ')[1].split('\n')

# [<Element 'index_backup_partition_name' at 0x7f6249261250>, <Element 'index_backup_partition_name' at 0x7f6249261f90>, <Element 'index_backup_partition_name' at 0x7f624926cc50>, <Element 'index_backup_partition_name' at 0x7f6249276910>, <Element 'index_backup_partition_name' at 0x7f624927e5d0>, <Element 'index_backup_partition_name' at 0x7f6249286290>, <Element 'index_backup_partition_name' at 0x7f6249286f10>, <Element 'index_backup_partition_name' at 0x7f624928fbd0>, <Element 'index_backup_partition_name' at 0x7f6247baf890>, <Element 'index_backup_partition_name' at 0x7f6247bb7550>, <Element 'index_backup_partition_name' at 0x7f6247bc0210>, <Element 'index_backup_partition_name' at 0x7f6247bc0e90>]

# ['/dev/sdb1: UUID="9440d8b7-6aa8-4b0e-8cd4-0527f90af20f" TYPE="ext4" ', '/dev/sdb2: UUID="b1caa32e-589b-4c5e-bfbf-f19ea7c7f539" TYPE="ext4" ', '/dev/sdb3: UUID="37113dad-5e9a-4d35-88b4-9b08f5c47308" TYPE="ext4" ', '/dev/sdc1: UUID="5430242b-a3bb-44dd-ad02-d6eac58529d5" TYPE="ext4" ', '/dev/sdc2: UUID="82a11ac5-0fd6-4fc1-bc97-bb199007a358" TYPE="ext4" ', '/dev/sdc3: UUID="3034d183-dd91-4178-9271-274c07ee5a66" TYPE="ext4"']
