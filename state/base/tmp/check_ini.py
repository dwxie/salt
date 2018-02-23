#!/usr/bin/env python
#

import ConfigParser
import re

file = '/home/tangtao/tracker/server.ini'
conf = ConfigParser.ConfigParser()
conf.read(file)
fh = open(file,'r+')
count_old = conf.getint('FORCED_BOND_RELAY','count')
print 'the count number is : %s' % count_old

bond_list = conf.options("FORCED_BOND_RELAY")
pattern = 'bond'
num_exist_list = []

for i in bond_list:
    bond_info = re.findall(pattern,i)
    if len(bond_info):
        num_exist = i.split('info')[1]
        num_exist_list.append(int(num_exist))

wrong_list = [ x for x in range(count_old) if x not in num_exist_list ]

if len(wrong_list):
    for i in wrong_list:
        print "the missing bond_info is : %s" %i
else:
    print "no missing bond_info in this ini"
