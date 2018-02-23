#!/usr/bin/env python
#coding:utf-8
#
import sys,os
import urllib,urllib2
import ConfigParser
import json
import re
from HTMLParser import HTMLParser

ctype = sys.argv[1]
cid = sys.argv[2]
relay_name = sys.argv[3]
relay_dict = json.load(open('cid.json','r+'))

def check_correct():
    type_list=['-a','-c']
    try:
        if len(sys.argv) < 2:
            print "Usage: sys.argv[0] -a(add) -c(change) cid relay_name"
            if ctype not in type_list:
                print "Usage: sys.argv[0] -a(add) -c(change) cid relay_name"
                if relay_name not in relay_json:
                    print "please check the relay_json"
    except IndexError,e:
        print aaa


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

check_correct()
