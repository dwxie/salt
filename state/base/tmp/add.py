#!/usr/bin/env python
#coding:utf-8
#
import sys,os
import urllib2,urllib
import json
import ConfigParser
from HTMLParser import HTMLParser
import logging
import argparse,time
import shutil

only_one_cid = ""
choice = ""
args = ""

ori_file = "/tmp/server.ini"
tmp_ori_file = "/tmp/tmp_%s" % os.path.split(ori_file)[1]
shutil.copy(ori_file,tmp_ori_file)

if len(sys.argv) == 3:
    choice = str(sys.argv[1])
    args = str(sys.argv[2])
    the_arg_dic = {}
    for i in args.split(" "):
        the_arg_dic[str(i.split(":")[0])] = i.split(":")[1]
elif len(sys.argv) == 2:
    only_one_cid = sys.argv[1]
else:
    print '''Usage:\n\t%s "cid"''' % sys.argv[0]
    print "-" * 10
    print '''Usage:\n\t%s "-a" "cid:111 type:111 ip:1.2.3.4 port:89"''' % sys.argv[0]
    print '''\n\t%s "-d" "cid:111 type:111"''' % sys.argv[0]
    print '''\n\t%s "-c" "cid:111 type:111 ip:1.2.3.4 port:89"''' % sys.argv[0]
    print '''\n\t%s "-q" "cid:111"''' % sys.argv[0]
    sys.exit()

conf = ConfigParser.ConfigParser()
#conf.read('/home/tangtao/tracker/server.ini')
#fh = open('/home/tangtao/tracker/server.ini','r+')
conf.read(tmp_ori_file)
fh = open(tmp_ori_file,'w+')
count_old = conf.getint('FORCED_BOND_RELAY','count')
FORCED_BOND_RELAY = conf.items("FORCED_BOND_RELAY")
FORCED_BOND_RELAY_LIST = []
for i,j in FORCED_BOND_RELAY:
    FORCED_BOND_RELAY_LIST.append([i,j])

# retval = c_list = [ c_type,c_status,c_public_ip,c_city,c_isp,c_state ]

def add(the_count_old,the_conf,new_dic_obj):
    the_conf.set('FORCED_BOND_RELAY','count',str(the_count_old+1))
    #  { 'relay_host':relay_host,'relay_ip':relay_ip,'carmer_type':retval[0] }
    the_conf.set('FORCED_BOND_RELAY',"bond_info"+str(the_count_old),str(new_dic_obj['cid'])+'_' + str(new_dic_obj['type'])+ '_' + str(new_dic_obj['ip']) + ":" + str(new_dic_obj['port']))
    the_conf.write(fh)
    fh.close()
    shutil.copy(tmp_ori_file,ori_file)

def deal_with_forced_bond_change(original_list,change_thing,arg_dict):
    for i in range(len(original_list)):
        #print original_list[i][0]
        #print delete_thing
        #time.sleep(0.2)
        if str(original_list[i][0]) == str(change_thing):
            original_list[i][1] = str("%s_%s_%s_%s" % (arg_dict['cid'],arg_dict['type'],arg_dict['ip'],arg_dict['port']))

def deal_with_forced_bond(original_list,delete_thing):
    original_list[0][1] = int(original_list[0][1]) - 1
    for i in range(len(original_list)):
        #print original_list[i][0]
        #print delete_thing
        #time.sleep(0.2)
        if str(original_list[i][0]) == str(delete_thing):
            original_list.remove(original_list[i])
            kk = i
            break
    for i in range(kk,len(original_list)):
        original_list[i][0] = "bond_info%s" % str(int(original_list[i][0][9:]) - 1)
    #for i in original_list:
    #   print i
    #print "=" * 100

def delete(the_count_old,the_conf,new_dic_obj,the_forced_bond_relay):
    print "-" * 30
    ff = 0
    need_to_delete = []
    for i in the_forced_bond_relay:
        if "%s_%s" % (new_dic_obj['cid'],new_dic_obj['type']) in i[1]:
            type_in_chinese = get_the_type_by_id(int(new_dic_obj['type']))
            ff += 1
            print "%s、 %s %s %s" % (ff,i[0],type_in_chinese,i[1])
            need_to_delete.append(i[0])
    print "-" * 30
    need_to_delete.reverse()
    for k in need_to_delete:
        deal_with_forced_bond(the_forced_bond_relay,k)

    the_conf.remove_section("FORCED_BOND_RELAY")
    the_conf.add_section("FORCED_BOND_RELAY")
    for i,j in the_forced_bond_relay:
        the_conf.set("FORCED_BOND_RELAY","%s" % i , "%s" % j)

    #the_conf.set('FORCED_BOND_RELAY','count',str(the_count_old - 1))
    ##  { 'relay_host':relay_host,'relay_ip':relay_ip,'carmer_type':retval[0] }
    #the_conf.set('FORCED_BOND_RELAY',"bond_info"+str(the_count_old),str(new_dic_obj['cid'])+'_' + str(new_dic_obj['type'])+ '_' + str(new_dic_obj['ip']) + str(new_dic_obj['port']))
    the_conf.write(fh)
    fh.close()
    shutil.copy(tmp_ori_file,ori_file)

def change(the_conf,new_dic_obj,the_forced_bond_relay):
    print "-" * 30
    ff = 0
    need_to_change = []
    ret = read_info_by_cid(new_dic_obj['cid'])
    for i in the_forced_bond_relay:
        if "%s_%s" % (new_dic_obj['cid'],ret[0]) in i[1]:
            number = i[1].split("_")[1]
            type_in_chinese = get_the_type_by_id(int(number))
            ff += 1
            print "%s、 %s %s %s" % (ff,i[0],type_in_chinese,i[1])
            need_to_change.append(i[0])
    print "-" * 30
    #need_to_change.reverse()
    for k in need_to_change:
        deal_with_forced_bond_change(the_forced_bond_relay,k,new_dic_obj)

    #the_conf.remove_section("FORCED_BOND_RELAY")
    #the_conf.add_section("FORCED_BOND_RELAY")

    for i,j in the_forced_bond_relay:
        the_conf.set("FORCED_BOND_RELAY","%s" % i , "%s" % j)

    #the_conf.set('FORCED_BOND_RELAY','count',str(the_count_old - 1))
    ##  { 'relay_host':relay_host,'relay_ip':relay_ip,'carmer_type':retval[0] }
    #the_conf.set('FORCED_BOND_RELAY',"bond_info"+str(the_count_old),str(new_dic_obj['cid'])+'_' + str(new_dic_obj['type'])+ '_' + str(new_dic_obj['ip']) + str(new_dic_obj['port']))
    the_conf.write(fh)
    fh.close()
    shutil.copy(tmp_ori_file,ori_file)

def query(new_dic_obj,the_forced_bond_relay):
    print "-" * 30
    ff = 0
    for i in the_forced_bond_relay:
        if "%s" % new_dic_obj['cid'] in i[1]:
            number = i[1].split("_")[1]
            type_in_chinese = get_the_type_by_id(int(number))
            ff += 1
            print "%s、 %s %s %s" % (ff,i[0],type_in_chinese,i[1])
    print "-" * 30

def get_the_type_by_id(number):
    if number == 160:
        pattern = 'A0'
    elif number == 192:
        pattern = 'C0'
    elif number == 208:
        pattern = 'D0'
    elif number == 224:
        pattern = 'E0'
    else:
        pattern = "Unknown"
    return pattern

def loops_for_something(the_location_dict,the_retval,the_relay_dict):
    for k,cities in the_location_dict.items():
        for city in cities:
            if the_retval[3] == city:
                for relay,relay_hosts in the_relay_dict.items():
                    if relay.split('_')[0] == k.split('_')[0]:
                        pattern = ""
                        for relay_host,relay_ip in relay_hosts.items():
                            if the_retval[0] == 160:
                                pattern = 'A0'
                            elif the_retval[0] == 192:
                                pattern = 'C0'
                            elif the_retval[0] == 208:
                                pattern = 'D0'
                            elif the_retval[0] == 224:
                                pattern = 'E0'
                            if pattern in relay_host:
                                relay_host = relay_host.split('_')[0] + '_' + relay_host.split('_')[1]
                                return (relay_host,relay_ip)
    print "check if is the city_list wrong ?"
    sys.exit(5)

def get_relay_info():
    retval = read_info()
    relay_dict = {
        'tz_relay':{
            'tz_sto1_A0':'122.226.181.106',     # A0
            'tz_relay3_C0':'122.226.181.25',    # C0
            'tz_relay4_D0':'122.226.181.26',    # D0
            'tz_relay7_E0':'122.226.181.29'     # E0
        },
        'sjz_relay':{
            'sjz_sto1_A0':'61.55.189.145',
            'sjz_relay4_C0':'61.55.189.142',
            'sjz_relay2_D0':'61.55.189.151',
            'sjz_relay6_E0':'61.55.189.144'
        },
        'fs_relay':{
            'fs_sto1_A0':'183.57.151.187',
            'fs_sto14_C0':'183.57.151.116',
            'fs_sto16_D0':'183.57.151.104',
            'fs_sto18_E0':'183.57.151.129'
        },
        'cs_relay':{
            'cs_sto8_A0':'103.38.42.76',
            'cs_sto1_CO':'103.38.42.69',
            'cs_sto3_D0':'103.38.42.71',
            'cs_sto5_E0':'103.38.42.73'
        },
        'CMCC_relay':{
            'CMCC1':'111.6.96.8:1935'
        }
    }
    location_dict = { 'fs_relay_list' : [ '广西','广东','云南','海南','香港','澳门' ], 'cs_relay_list' : [ '重庆','湖北','湖南','江西','贵州','四川','西藏' ], 'sjz_relay_list' : [ '新疆','青海','河北','山西','内蒙古','吉林','黑龙江','北京','天津','辽宁','陕西','宁夏','甘肃','山东','河南' ],'tz_relay_list' : [ '浙江','江苏','安徽','福建','上海' ] }
    relay_host,relay_ip = loops_for_something(location_dict,retval,relay_dict)

    print "this carmer(cid: %s),(type: %s), is going to bond to relay(host: %s),( ip: %s)" %( only_one_cid,retval[0],relay_host,relay_ip)
    return  { 'relay_host':relay_host,'relay_ip':relay_ip,'carmer_type':retval[0] }

def get_info_by_cid(one_cid):
    try:
        url = 'http://120.26.74.53:8077/tracker_monitor/get_camera_json?cid='+one_cid
        user = 'admin'
        password = 'Megaium!'
        p = urllib2.HTTPPasswordMgrWithDefaultRealm()
        p.add_password(None,url,user,password)
        handler = urllib2.HTTPBasicAuthHandler(p)
        opener = urllib2.build_opener(handler)
        urllib2.install_opener(opener)
        page = urllib2.urlopen(url).read()
        return page
    except IndexError,e:
        print e,'wrong input for carmer id'

def get_info():
    try:
        url = 'http://120.26.74.53:8077/tracker_monitor/get_camera_json?cid='+only_one_cid
        user = 'admin'
        password = 'Megaium!'
        p = urllib2.HTTPPasswordMgrWithDefaultRealm()
        p.add_password(None,url,user,password)
        handler = urllib2.HTTPBasicAuthHandler(p)
        opener = urllib2.build_opener(handler)
        urllib2.install_opener(opener)
        page = urllib2.urlopen(url).read()
        return page
    except IndexError,e:
        print e,'wrong input for carmer id'

def read_info_by_cid(one_cid):
    retval = get_info_by_cid(one_cid)
    retdict = json.loads(retval,encoding='utf-8')
    c_type = retdict['center_data']['storage_type']
    c_status = retdict['result_code']
    c_state = retdict['center_data']['state']
    c_public_ip = retdict['center_data']['public_ip']
    c_city = retdict['center_data']['ip_geo']['city'].encode('utf-8')
    c_isp = retdict['center_data']['ip_geo']['isp'].encode('utf-8')
    c_list = [ c_type,c_status,c_public_ip,c_city,c_isp,c_state ]
    return c_list

def read_info():
    retval = get_info()
    retdict = json.loads(retval,encoding='utf-8')
    c_type = retdict['center_data']['storage_type']
    c_status = retdict['result_code']
    c_state = retdict['center_data']['state']
    c_public_ip = retdict['center_data']['public_ip']
    c_city = retdict['center_data']['ip_geo']['city'].encode('utf-8')
    c_isp = retdict['center_data']['ip_geo']['isp'].encode('utf-8')
    c_list = [ c_type,c_status,c_public_ip,c_city,c_isp,c_state ]
    return c_list

def is_online():
    result = read_info()
    if result[1] == 0:
        return True
    else:
        return False

def is_exist_in_conf():
    flag = 0
    for i in range(count_old):
        value = conf.get('FORCED_BOND_RELAY','bond_info'+str(i))
        if str(only_one_cid) in value:
            flag = 1
    if flag == 0:
        return False
    else:
        return True

def is_pushing():
    retval = read_info()
    if retval[5] != 4:
        return True
    else:
        return False

def add_bond():
    retval = get_relay_info()
    conf.set('FORCED_BOND_RELAY','count',str(count_old+1))
    #  { 'relay_host':relay_host,'relay_ip':relay_ip,'carmer_type':retval[0] }
    conf.set('FORCED_BOND_RELAY',"bond_info"+str(count_old),str(only_one_cid)+'_' + str(retval['carmer_type'])+ '_' + str(retval['relay_ip'])+':1935')
    conf.write(fh)
    fh.close()
    shutil.copy(tmp_ori_file,ori_file)

def start():
    if is_online():
        if is_pushing():
            print 'This carmer is now pushing...'
            sys.exit(4)
        else:
            if is_exist_in_conf():
                print 'the carmer is already in relay_bond_info'
                sys.exit(3)
            else:
                add_bond()
    else:
        print 'this carmer is now offline !!!'
        sys.exit(2)

if only_one_cid != "":
    start()
elif choice != "":
    if choice not in ["-q","-a","-c","-d"]:
        print '''Sorry.. Only "add" "query" "change" "delete" four supported.'''
        sys.exit()
    if choice == "-a":
        add(count_old,conf,the_arg_dic)
    elif choice == "-d":
        delete(count_old,conf,the_arg_dic,FORCED_BOND_RELAY_LIST)
    elif choice == "-c":
        change(conf,the_arg_dic,FORCED_BOND_RELAY_LIST)
    elif choice == "-q":
        query(the_arg_dic,FORCED_BOND_RELAY_LIST)
else:
    print "Some Error..l"
    sys.exit()

os.remove(tmp_ori_file)
