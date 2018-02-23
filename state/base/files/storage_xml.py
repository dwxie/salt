# -*- coding: utf-8 -*-
from xml.dom import minidom
from collections import OrderedDict
import time
import commands

### Out File name ###
now = time.strftime("%Y-%m-%d-%H:%M:%S",time.localtime())
filename = now + '.xml'

### Configuration ###
tracker_ip = 'tracker_IP'
tracker_port = '5730'
public_ip = 'public_IP'
local_ip = 'public_IP'
rabbitmq = ['web1_IP','web2_IP','web3_IP']
rabbitmq_port = '5672'
rabbitmq_username = 'orange'
rabbitmq_password = '831206'


### Get disk wwn ###
cmd = "ls /dev/disk/by-id | grep wwn | grep -v part"
disk_list = commands.getoutput(cmd).split('\n')

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
    
'''
ExpireDay = doc.createElement('ExpireDay')
ExpireDay_text = doc.createTextNode('7')
ExpireDay.appendChild(ExpireDay_text)

mem_cache = doc.createElement('mem_cache')
mem_cache_text = doc.createTextNode('512')
mem_cache.appendChild(mem_cache_text)
'''

ExpireDay = add_text('ExpireDay','7')
mem_cache = add_text('mem_cache','512')
rabbitmq_cluster = rabbitmq_node(rabbitmq)

partitionS = doc.createElement('partitions')

num = 1
for disk in disk_list:
    partitionS.appendChild(child_tree('partition',enable='1',automount='1',index_partition_name='/dev/disk/by-id/' + disk + '-part2',data_partition_name='/dev/disk/by-id/' + disk + '-part3',fs_type='ext4',index_partition_mount='/disk/' +str(num) + '/index',data_partition_mount='/disk/' + str(num) + '/data',tracker_server_ip=tracker_ip,tracker_server_port=tracker_port,public_ip=public_ip,local_ip=local_ip,server_port=str(9000 + num),rabbitmq_cluster=rabbitmq_node(rabbitmq)))
    num +=1



config.appendChild(ExpireDay)
config.appendChild(mem_cache)
config.appendChild(partitionS)

doc.appendChild(config)
### Output XML ###
with open(filename,'w') as f:
    f.write(doc.toprettyxml(encoding="UTF-8",indent="\t",newl="\n"))