#!/usr/bin/env python
# -*- coding:utf-8 -*-
#

import sys
import os
import logging
import json
import argparse
import re
import json
import argparse
import traceback
import urllib2
import urllib
import time
import shutil
reload(sys)
sys.setdefaultencoding('utf-8')

inputJsonFile = '/opt/tracker/config/cid_bond_relay.json'
outputJsonFile = '/tmp/new_bond_relay.json'
default_cmcc_relay = '111.6.100.227'
default_event_relay = '103.38.42.74'
default_public_relay = '122.226.181.28'
relayYamlFile = '/opt/tracker/relay.yaml'

class MyParser(argparse.ArgumentParser):
    def error(self, message):
        sys.stderr.write('error: %s\n' % message)
        self.print_help()
        sys.exit(2)

def handlerArgs():
    parser = MyParser()
    #parser = argparse.ArgumentParser()
    parser.add_argument('-c', dest='cids', type=str, nargs='*')
    parser.add_argument('-p', dest='port', type=str)
    parser.add_argument('-a', dest='address', type=str)
    parser.add_argument('-s', action='store_true',help="需要搜索时")
    parser.add_argument('-d', action='store_true',help="需要删除时")
    parser.add_argument('-t', dest='type', type=str)
    if len(sys.argv)==1:
        parser.print_help()
        sys.exit(1)
    return parser.parse_args()


def getInfo(cid):
    url = 'http://42.51.12.141/tracker_monitor/get_camera_json?cid='+cid
    user = 'admin'
    password = 'Megaium!'
    p = urllib2.HTTPPasswordMgrWithDefaultRealm()
    try:
        p.add_password(None, url, user, password)
    except IndexError as e:
        print('Error:', e)
        sys.exit()
    handler = urllib2.HTTPBasicAuthHandler(p)
    opener = urllib2.build_opener(handler)
    urllib2.install_opener(opener)
    page = urllib2.urlopen(url).read()
    return page


def readInfo(cid):
    retdict = json.loads(getInfo(cid), encoding='utf-8')
    cam_status = retdict['result_code'] if 'result_code' in retdict else ""
    cam_type = str(retdict['center_data']['storage_type']) \
        if 'storage_type' in retdict['center_data'] else ""
    cam_ip = retdict['center_data']['public_ip'] if \
        'public_ip' in retdict['center_data'] else ""
    cam_state = retdict['center_data']['state'] if \
        'state' in retdict['center_data'] else ""
    c_list = [
        cam_status,
        cam_type,
        cam_ip,
        cam_state
    ]
    return c_list


def ifIsOnline(cid):
    if readInfo(cid)[0] == 0:
        return True
    else:
        return False


def ifIsExistInConfig(CID):
    exist_cid_list = []
    with open(inputJsonFile, 'r+') as fh:
        bond_relay_list = json.load(fh)['cid_force_bond_relay']
        for i in range(len(bond_relay_list)):
            exist_cid_list.append(str(bond_relay_list[i]['cid'])
                                  + "_"
                                  + str(bond_relay_list[i]['areaid']))
    if str(CID) in exist_cid_list:
        return True
    else:
        return False


def ifIsPushing(cid):
    if readInfo(cid)[3] == 4:
        return True
    else:
        return False


def checkTheTelecom(cid):
    url_ipip = 'http://freeapi.ipip.net/' + readInfo(cid)[2]
    try:
        response = urllib2.urlopen(url_ipip)
    except urllib2.URLError as e:
        print(e.reason)
    except urllib2.HTTPError as e:
        print(e.code)
    retjson = response.read()
    isp = json.loads(retjson)[-1].encode('utf-8')
    return isp


def checkTheManual():
    """
    To determining whether is manual or automatic bond
    """
    if 'address' in args or 'port' in args or 'type' in args:
        return True
    else:
        return False


def addBondInfo(CID):
    cid = CID.split('_')[0]
    ctype = CID.split('_')[1]
    telecom = checkTheTelecom(cid)
    fin = open(inputJsonFile, 'r')
    fout = open(outputJsonFile, 'w')
    outDict = {}
    if checkTheManual:
        outDict['cid'] = int(cid)
        if args.address:
            outDict['relay_ip'] = args.address
        else:
            print "-a is required when you add a camera manually"
            sys.exit()
        if args.port:
            outDict['relay_port'] = int(args.port)
        else:
            outDict['relay_port'] = 1935
        if args.type:
            outDict['areaid'] = int(args.type)
        else:
            outDict['areaid'] = int(ctype)
    else:
        if telecom == '移动' or telecom == '铁通':
            outDict = {'relay_ip': default_cmcc_relay, 'areaid': int(ctype),
                       'relay_port': 1935,
                       'cid': int(cid)}
        elif (telecom == '电信' or telecom == '联通') and ctype == '208':
            outDict = {'relay_ip': default_public_relay,
                       'areaid': int(ctype),
                       'relay_port': 1935,
                       'cid': int(cid)}
        elif (telecom == '电信' or telecom == '联通') and ctype == '160':
            outDict = {'relay_ip': default_event_relay,
                       'areaid': int(ctype),
                       'relay_port': 1935,
                       'cid': int(cid)}
        elif ctype == '176':
            outDict = {'relay_ip': default_event_relay,
                       'areaid': int(ctype),
                       'relay_port': 1935,
                       'cid': int(cid)}
        else:
            print "The Type of Camera May Not Right ... \
                    Fail To Add Bondinfo..."
            sys.exit()
    retdict = json.load(fin)
    retdict['cid_force_bond_relay'].append(outDict)
    outStr = json.dumps(retdict, indent=4)
    fout.write(outStr.strip().encode('utf-8')+'\n')
    fin.close()
    fout.close()


def deleteCid(CID):
    fin = open(inputJsonFile, 'r')
    fout = open(outputJsonFile, 'w')
    configDict = json.load(fin)
    bondList = configDict['cid_force_bond_relay']
    for i in reversed(range(len(bondList))):
        if bondList[i].get('cid') == int(cid):
            configDict['cid_force_bond_relay'].pop(i)
    outStr = json.dumps(configDict, ensure_ascii=False, indent=4)
    fout.write(outStr.strip().encode('utf-8') + '\n')
    fin.close()


def findMachineInfo(cid):
    import yaml
    fh = open(inputJsonFile)
    configDict = json.load(fh)
    relayYaml = yaml.load(file(relayYamlFile))
    bondList = configDict['cid_force_bond_relay']
    retlist = []
    for item in bondList:
        if item['cid'] == int(cid):
            relayIp = item['relay_ip'].encode('utf-8')
            cameraTypeInConf = item['areaid']
            break
        else:
            relayIp = 'Not exist'
            cameraTypeInConf = 'Not exist'
    retlist.append(cameraTypeInConf)
    retlist.append(relayIp)
    bondRelayMachine = 'Not exist'
    for machine in relayYaml:
        for ip in relayYaml[machine]['ipv4']:
            if ip == retlist[1]:
                bondRelayMachine = machine
                break
        if bondRelayMachine != 'Not exist':
            break
    retlist.append(bondRelayMachine)
    return retlist


def searchCid(cid):
    for cid in args.cids:
        cidInfo = {
                    "cameraId": cid,
                    "cameraType": readInfo(cid)[1],
                    "cameraTypeInConfig": findMachineInfo(cid)[0],
                    "publicIp": readInfo(cid)[2],
                    "Telecom ": checkTheTelecom(cid).decode('utf-8'),
                    "bondRelayMachine": findMachineInfo(cid)[2],
                    "bondRelayIp": findMachineInfo(cid)[1]
                  }
    cidInfoJson = json.dumps(cidInfo, ensure_ascii=False, indent=4)
    print cidInfoJson
    return cidInfo


def changeBondInfo(inputJsonFile, outputJsonFile, CID, **args):
    fin = open(inputJsonFile, 'r')
    fout = open(outputJsonFile, 'w')
    configDict = json.load(fin)
    bondList = configDict['cid_force_bond_relay']
    for item in bondList:
        if item['cid'] == int(CID.split('_')[0]) and \
           item['areaid'] == int(CID.split('_')[1]):
            if 'address' in args:
                item['relay_ip'] = args['address']
            if 'port' in args:
                item['relay_port'] = int(args['port'])
            if 'type' in args:
                item['areaid'] = int(args['type'])
    outStr = json.dumps(configDict, ensure_ascii=False, indent=4)
    fout.write(outStr.strip().encode('utf-8') + '\n')
    fin.close()
    fout.close()


def execChange():
    from datetime import datetime
    now = datetime.now()
    nowTime = now.strftime('%Y_%m_%d_%H_%M_%S')
    shutil.move(inputJsonFile, inputJsonFile + nowTime)
    shutil.move(inputJsonFile + nowTime, '/opt/tracker/config/oldfile')
    os.rename(outputJsonFile, inputJsonFile)


if __name__ == '__main__':
    args = handlerArgs()
    if args.s is not True:
        for cid in args.cids:
            CID = cid + '_' + readInfo(cid)[1]
            if ifIsOnline(cid):
                if ifIsPushing(cid):
                    print "=" * 50
                    print "This carmer is now pushing ... Need to restart !!! "
                else:
                    print "=" * 50
                    print "this camera is now linking ... \
                            Check the status 3 mins after"
                argDict = {}
                if args.address:
                    argDict['address'] = args.address
                if args.port:
                    argDict['port'] = args.port
                if args.type:
                    argDict['type'] = args.type
                if ifIsExistInConfig(CID) and argDict == {} \
                   and args.d is False:
                    print "=" * 50
                    print "this camrea is already in the bond list ... \
                           please use -t to change the type or -a to change \
                           the address or -p to change the port"
                    time.sleep(1)
                    sys.exit()
                elif ifIsExistInConfig(CID) and argDict:
                    print "=" * 50
                    print "Now is changing the bond info config json file"
                    changeBondInfo(inputJsonFile, outputJsonFile, CID,
                                   **argDict)
                    execChange()
                elif ifIsExistInConfig(CID) and args.d and argDict == {}:
                    print "=" * 50
                    print 'Now is deleting the cid: %s which type is: %s' \
                        % (CID.split('_')[0], CID.split('_')[1])
                    deleteCid(cid)
                    execChange()
                else:
                    print "=" * 50
                    print "Now is adding bond info of the camera"
                    addBondInfo(CID)
                    execChange()
            else:
                print "=" * 50
                print " This camera is offline !!! \
                    check the status and return to Huang "
                time.sleep(1)
                sys.exit()
    else:
        print "=" * 50
        print " You are now searching Information of %s " % args.cids
        searchCid(args.cids)
    print "=" * 50
