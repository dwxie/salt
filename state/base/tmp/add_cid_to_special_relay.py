#!/usr/bin/env python
#
import ConfigParser
import sys,os

conf = ConfigParser.ConfigParser('')
conf.read('/home/tangtao/tracker/server.ini')
fh = open('/home/tangtao/tracker/server.ini','r+')
c_list = [ 537014776,537009887,537001989,537002156,537012849,537017660,537009305 ]

for cid in c_list:
    count_old = conf.getint('FORCED_BOND_RELAY','count')
    conf.set('FORCED_BOND_RELAY','bond_info'+str(count_old),str(cid)+'_160_'+'103.38.42.76:1935')
    conf.set('FORCED_BOND_RELAY','count',str(count_old+1))

conf.write(fh)

