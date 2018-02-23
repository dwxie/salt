# -*- coding: utf-8 -*-
from xml.dom import minidom
from collections import OrderedDict
import time
import commands
import re

### Out File name ###
#now = time.strftime("%Y-%m-%d-%H:%M:%S",time.localtime())
filename = 'storage.conf'

### Configuration ###
tracker_ip = '172.31.15.49'
tracker_port = '5730'
public_ip = '172.31.4.206'
local_ip = '172.31.4.206'
rabbitmq = ['172.31.15.49']
rabbitmq_port = '5672'
rabbitmq_username = 'megaium'
rabbitmq_password = 'Megaium!'


### Get all disk /dev/sda  /dev/sdb ###
cmd = "lsblk  | grep -w 'disk ' | awk '{print $1}'"
disk_list = commands.getoutput(cmd).split('\n')
print('all disk is: %s.' % (disk_list))


# Get system disk /dev/sde
cmd = "df | grep /dev/xvd | awk '{print $1}' | cut -c 6-9"
sysdisk = commands.getoutput(cmd)
print('system disk is: %s.' % (sysdisk))


### Main ###

doc = minidom.Document()

config = doc.createElement('config')

def add_text(name,text):
    '''
    添加文本子项
    '''
    tmp = doc.createElement(name)
    if isinstance(text,basestring):
        tmp_text = doc.createTextNode(text)
        tmp.appendChild(tmp_text)
    else:
        tmp.appendChild(text)
    return tmp

def child_tree(name,**kwargs):
    '''
    添加子树
    '''
    kwargs = OrderedDict(kwargs)
    tmp = doc.createElement(name)
    for key in kwargs:
        print 'another keyword arg:%s:%s' % (key, kwargs[key])
        if isinstance(kwargs[key],basestring):
            t = add_text(key,kwargs[key])
            tmp.appendChild(t)
        else:
            tmp.appendChild(kwargs[key])
    return tmp

def rabbitmq_node(rabbitmq):
    tmp = doc.createElement('rabbitmq_cluster')
    for node in rabbitmq:
        tmp.appendChild(child_tree('node',enable='1',ip=node,port=rabbitmq_port,username=rabbitmq_username,password=rabbitmq_password))
    return tmp
    
mem_cache = add_text('mem_cache','512')
download_cache = add_text('download_cache','270')

partitionS = doc.createElement('partitions')

num = 1
for disk in disk_list:
	if disk == sysdisk: 
        	print('found system disk, not insert into xml. disk: %s' % (disk))
	else:
        	tmp = doc.createElement('partition')
	        t = add_text('enable','1')
	        tmp.appendChild(t)
        	t = add_text('automount','1')
	        tmp.appendChild(t)
        	t = add_text('fs_type','ext4')
	        tmp.appendChild(t)

                cmd = "blkid  | grep %s | awk '{print $2}' | cut -c 7-42" % (disk)
                uuids = commands.getoutput(cmd).split('\n')
                print('disk: %s' % (disk))
                print('uuid: %s' % (uuids))
                if len(uuids) != 3:
                     print('error, part count != 3')
                     continue
                else:
                     t = add_text('index_backup_partition_name','/dev/disk/by-uuid/' + uuids[0])
		     tmp.appendChild(t)
	             t = add_text('index_partition_name','/dev/disk/by-uuid/' + uuids[1])
		     tmp.appendChild(t)
	             t = add_text('data_partition_name','/dev/disk/by-uuid/' + uuids[2])
	             tmp.appendChild(t)
        	t = add_text('index_backup_partition_mount','/disk/' +str(num) + '/index_backup')
        	tmp.appendChild(t)
	        t = add_text('index_partition_mount','/disk/' +str(num) + '/index')
        	tmp.appendChild(t)
	        t = add_text('data_partition_mount','/disk/' + str(num) + '/data')
	        tmp.appendChild(t)
        	t = add_text('public_ip',public_ip)
	        tmp.appendChild(t)
        	t = add_text('local_ip',local_ip)
	        tmp.appendChild(t)
        	t = add_text('server_port',str(9000 + num))
	        tmp.appendChild(t)
        	t = add_text('tracker_server_ip',tracker_ip)
	        tmp.appendChild(t)
        	t = add_text('tracker_server_port',tracker_port)
	        tmp.appendChild(t)
        	t = rabbitmq_node(rabbitmq)
	        tmp.appendChild(t)
        	num += 1
	        partitionS.appendChild(tmp)

config.appendChild(mem_cache)
config.appendChild(download_cache)
config.appendChild(partitionS)

doc.appendChild(config)
### Output XML ###
with open(filename,'w') as f:
    f.write(doc.toprettyxml(encoding="UTF-8",indent="\t",newl="\n"))


