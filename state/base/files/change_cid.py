#!/usr/bin/env python
#coding:utf-8
#
# added by kid 2016-12-8

import time
import sys,os
import urllib,urllib2
import ConfigParser
import json
import re
import MySQLdb
from HTMLParser import HTMLParser

relay_dict = { 'fs_relay_list' : [ '广西','广东','云南','海南','香港','澳门' ], 'cs_relay_list' : [ '重庆','湖北','湖南','江西','贵州','四川','西藏' ], 'sjz_relay_list' : [ '新疆','青海','河北','山西','内蒙古','吉林','黑龙江','北京','天津','辽宁','陕西','宁夏','甘肃','山东','河南' ],'tz_relay_list' : [ '浙江','江苏','安徽','福建','上海' ] }
relay_list_CMCC = [ '111.7.132.189:1935' ]
cid = str(sys.argv[1])
conf = ConfigParser.ConfigParser()
conf.read('/tmp/server.ini')
fh = open('/tmp/server.ini','r+')
count_old = conf.getint('FORCED_BOND_RELAY','count')

def get_json(cid):

    url = 'http://120.26.74.53:8077/tracker_monitor/get_camera_json?cid='+cid
    user = 'admin'
    passwd = 'Megaium!'
    p = urllib2.HTTPPasswordMgrWithDefaultRealm()       # Keep a database of (realm, uri) -> (user, password) mappings. A realm of None is considered a catch-all realm, which is searched if no other realm fits.
    p.add_password(None,url,user,passwd)        # None represent realm...
    handler = urllib2.HTTPBasicAuthHandler(p)
    opener = urllib2.build_opener(handler)
    urllib2.install_opener(opener)
    page = urllib2.urlopen(url).read()
    return page

result = json.loads(get_json(cid))
url = 'http://www.ip138.com/ips138.asp?ip='+ result['center_data']['public_ip']
response = urllib.urlopen(url)
html = response.read()
#print html

def is_exist_in_conf():
    exist_list = []
    for i in range(count_old):
        value = conf.get('FORCED_BOND_RELAY',"bond_info"+str(i))
        exist_list.append(value.split('_')[0])
    if str(cid) in exist_list:
        return True
    else:
        return False

def is_online():
    if result['result_code'] == 0:
        return True
    else:
        return False

def start():
    if is_online():
        if is_pushing():
            print 'the camera is now pushing...'
            sys.exit(4)
        else:
            print 'the camera is now changing the relay...'
            if is_exist_in_conf():
                print " the camera has already in the bond_list\n now do the change..."
                isp = get_isp_result()
                if isp == 'CMCC':
                    print "your carmer ISP is %s now change to YiDong..." %isp
                    change_to_CMCC()
                elif isp == 'liantong':
                    print "your carmer ISP is %s now change to LianTong..." %isp
                    change_bondinfo()
                elif isp == 'dianxing':
                    print "your carmer ISP is %s now change to DianXing..." %isp
                    change_bondinfo()
            else:
                print " the camera dose not in the bond_list now do the add..."
                add_bondinfo()
    else:
        print "This Camera OFF line!"
        sys.exit(2)

def get_data_from_db():

    mechina_ip_port_dict = {}
    location = get_location_result()
    role = get_role_result()
    isp = get_isp_result()
    conn = MySQLdb.connect(user='root',passwd='redhat',host='localhost',db='test')
    cur = conn.cursor()
    param = (location,isp,role)
    sql = "select mechina_name,internet_ip,Port from coll_test1 where mechina_name rlike '%s.*' and ISP='%s' and Role='%s'" % (location,isp,role)
    cur.execute(sql)
    result_data = cur.fetchall()
    print result_data
    for row in result_data:
        mechina = row[0]
        ip_port = str(row[1])+':'+str(row[2])
        mechina_ip_port_dict[mechina] = ip_port
    return mechina_ip_port_dict

def is_pushing():
    if result['center_data']['state']  == 4:
        return True
    elif result['center_data']['state']  == 3:
        return False

def add_bondinfo():
    conf.set('FORCED_BOND_RELAY','count',str(count_old+1))
    carmer_type = get_role_result()
    adict = get_data_from_db()
    isp = get_isp_result()
    if adict == {} and isp == 'CMCC':
        print 'there is no information from db \nadd to CMCC'
        conf.set('FORCED_BOND_RELAY','"bond_info"+str(count_old)',str(cid)+'_'+relay_list_CMCC[0])
        conf.write(fh)
        time.sleep(10)
        if is_pushing():
            print 'success bond carmer CID : %s to relay : %s' %(cid,relay_list_CMCC[0])
        else:
            print 'failed bond carmer CID : %s to relay : %s' %(cid,relay_list_CMCC[0])
            sys.exit(6)
    else:
        for k,v in adict.items():
            print 'now add to relay_server %s IP and Ports are %s'%(k,v)
            port = v.split(':')[1]
            ip = v.splist(':')[0]
            conf.set('FORCED_BOND_RELAY','"bond_info"+str(count_old)',str(cid)+'_'+carmer_type+'_'+ip+':'+port)
            conf.write(fh)
            time.sleep(10)
            if is_pushing():
                print 'success pushing the new carmer'
            else:
                print 'added but cannot be pushed...'

def get_urlinfo(public_ip):
    url = 'http://m.ip138.com/ip.asp?ip='+public_ip
    response = urllib2.urlopen(url)
    html = response.read()

def get_cam_bondkey_in_confile(cid):
    for section in conf.sections():
        if section == 'FORCED_BOND_RELAY':
            for opt in conf.options(section):
                value = conf.get(section,opt)
                if opt != 'count':
                    cam_id = value.split('_')[0]
                    if str(cid) == cam_id:
                        option = opt
    return option

def change_bondinfo():
    adict = get_data_from_db()
    for k,v in adict.items():
        print 'now change to relay_server %s IP and Ports are %s'%(k,v)
        port = v.split(':')[1]
        ip = v.splist(':')[0]
        carmer_type = get_role_result()
        bond_key = get_cam_bondkey_in_confile()
        conf.set('FORCED_BOND_RELAY',bond_key,str(cid)+carmer_type+ip+':'+port)
        conf.write(open(fh))
        time.sleep(10)
        if is_pushing():
            print "this carmer CID: %s is success pushing..." %cid
            sys.exit(2)
        else:
            print "this carmer CID: %s is failure pushing..." %cid
            time.sleep(1)
            print "now change to another bond_key..."
            continue

def change_to_CMCC():
    print 'now change to CMCC relay: %s' %relay_list_CMCC[0]
    carmer_type = get_role_result()
    bond_key = get_cam_bondkey_in_confile()
    bond_value = str(cid)+carmer_type+relay_list_CMCC[0]
    conf.set('FORCED_BOND_RELAY',bond_key,bond_value)
    conf.write(open(fh))
    if is_pushing():
        print 'success bond to CMCC relay %s' %relay_list_CMCC[0]
    else:
        print 'bond to CMCC failure...'
        sys.exit(3)

class MyHTMLParser(HTMLParser):

    def __init__(self):
        HTMLParser.__init__(self)
#        self.reset()
        self.flag = False
        self.text = ""
        self.astring = ""

#    def reset(self):
#        self.rawdata = ''
#        _markupbase.ParserBase.reset(self)

    def handle_starttag(self,tag,attrs):
        if tag == 'ul' and attrs:
            for key,value in attrs:
                if key == "class" and value == "ul1":
                    self.flag = True

    def handle_endtag(self,tag): # 同时定义开始和结束标签才有效,并且取数据的结尾标签必须在数据后
        if tag != 'li':
            self.flag = False

    def handle_data(self,data):
        if self.flag == True:
            self.text = data
            if '本站数据' in self.text:
                string = self.text.split('：')[1]
                self.astring += json.dumps(string,encoding='utf-8',ensure_ascii=False)

def get_html_result():
    parser = MyHTMLParser()
    parser.feed(html.decode('gbk').encode('utf-8'))
    return parser.astring
    parser.close()

def get_location_result():
    html_result = get_html_result()
    for key,value in relay_dict.items():
        for i in value:
            if i in html_result:
                location = key.split('_')[0]
    return location

def get_isp_result():
    html_result = get_html_result()
    ISP = html_result.split('  ')[1].split('"')[0]
    if ISP in ["移动","铁通"]:
        return 'CMCC'
    elif ISP == "联通":
        return 'liantong'
    elif ISP == "电信":
        return 'dianxing'

def get_role_result():
    role = result['center_data']['storage_type']
    if role == 192:
        return 'C0'
    elif role == 208:
        return 'D0'
    elif role == 224:
        return 'E0'

start()
