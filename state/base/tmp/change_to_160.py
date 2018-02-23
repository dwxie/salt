#!/usr/bin/env python
#
import sys,os
import ConfigParser
import json

relay_ip = '111.6.96.5'
config_file = '/home/tangtao/tracker/server.ini'

conf = ConfigParser.ConfigParser()
conf.read('/home/tangtao/tracker/server.ini')
fh = open('/home/tangtao/tracker/server.ini','w')

def change_bondinfo():
    for kvs in conf.items('FORCED_BOND_RELAY'):
        #if kvs[0] != 'count':
            # print kvs[1].split('_')[2].split(':')[0]
        if (kvs[0] != 'count' and kvs[1].split('_')[2].split(':')[0] == relay_ip ):
            port = '1935'
            type_A0 = '160'
            cid = kvs[1].split('_')[0]
            opt = kvs[0]
            conf.set ('FORCED_BOND_RELAY', opt, cid+'_'+type_A0+'_'+relay_ip+':'+port)
            # print cid+'_'+type_A0+'_'+relay_ip+':'+port
    conf.write(fh)

if __name__ == '__main__':
    change_bondinfo()
