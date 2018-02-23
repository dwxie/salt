#!/usr/bin/env python
#coding:utf-8
#
import sys,os
import urllib2,urllib
import json
import ConfigParser

config_file = '/home/tangtao/tracker/server.ini'
cid = sys.argv[1]
cmcc_relay1 = '111.6.96.5'

def get_info():
    try:
        url = 'http://120.26.74.53:8077/tracker_monitor/get_camera_json?cid='+cid
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

def read_info():
    retval = get_info()
    retdict = json.loads(retval,encoding='utf-8')
    c_type = retdict['center_data']['storage_type']
    c_status = retdict['result_code']
    c_state = retdict['center_data']['state']
    c_public_ip = retdict['center_data']['public_ip']
    c_list = [ c_type,c_status,c_public_ip,'aaa','bbb',c_state ]
    return c_list

def if_is_online():
    retval = read_info()
    if retval[1] == 0:
        return True
    else:
        return False

def if_is_exist_in_conf():
    exist_list = []
    conf = ConfigParser.ConfigParser() # 冗余
    conf.read(config_file)
    count_old = conf.getint('FORCED_BOND_RELAY','count')
    for count in range(count_old):
        value = conf.get('FORCED_BOND_RELAY','bond_info'+str(count)).split('_')[0]
        exist_list.append(value)
    # print exist_list
    if str(cid) in exist_list:
        return True
    else:
        return False

def if_is_pushing():
    retval = read_info()
    if retval[5] == 4:
        return True
    else:
        return False

def check_if_is_cmcc():
    retval = read_info()
    url_ipip = 'http://freeapi.ipip.net/' + retval[2]
    response = urllib2.urlopen(url_ipip)
    retjson = response.read()
    isp = json.loads(retjson)[-1].encode('utf8')
    if ( isp == '移动' or isp == '铁通' ):
        return True
    else:
        return False

def add_bond():

    retval = read_info()
    conf = ConfigParser.ConfigParser()
    conf.read(config_file)
    count_old = conf.getint('FORCED_BOND_RELAY','count')
    conf.set('FORCED_BOND_RELAY','count',str(count_old+1))
    conf.set('FORCED_BOND_RELAY',"bond_info"+str(count_old),str(cid)+'_' +str(retval[0])+ '_' +cmcc_relay1+':1935')
    conf.write(fh)
    fh.seek(0)
    for line in fh.readlines():
        print line.strip('\n')

if __name__ == '__main__':
    with open(config_file,'r+') as fh:
        if if_is_online():
            if if_is_pushing():
                print "This carmer is now pushing...Need to restart!!!"
                if if_is_exist_in_conf():
                    print "=========================================="
                    print "this camrea is already in the bond list...please check"
                    print "=========================================="
                    sys.exit(1)
                else:
                    if check_if_is_cmcc():
                        add_bond()
                    else:
                        print "This is not a CMCC camera !!! "
                        sys.exit(2)
            else:
                print 'This carmer is now linking...'
                if if_is_exist_in_conf():
                    print "=========================================="
                    print "this camrea is already in the bond list...please check"
                    print "=========================================="
                    sys.exit(1)
                else:
                    if check_if_is_cmcc():
                        add_bond()
                    else:
                        print "This is not a CMCC camera !!! "
                        sys.exit(2)
