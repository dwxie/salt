#!/usr/bin/env python
#coding: utf-8
#
import json
import shutil

inputJsonFile = '/opt/tracker/config/cid_bond_relay.json'
outputJsonFile = '/tmp/new_cid_bond_relay.json'
cmcc_relay1 = '111.6.96.5'

def deleteCid():
    fin = open(inputJsonFile,'r')
    fout = open(outputJsonFile,'w')
    configDict = json.load(fin)
    bondList = configDict['cid_force_bond_relay']
    for i in reversed(range(len(bondList))):
        if bondList[i].get('relay_ip') == cmcc_relay1:
            configDict['cid_force_bond_relay'].pop(i)
#    for item in bondList:
#        if item['relay_ip'] == cmcc_relay1:
#            bondList.remove(item)
    outStr = json.dumps(configDict,ensure_ascii = False,indent = 4)
    fout.write(outStr.strip().encode('utf-8') + '\n')
    fin.close()

deleteCid()
