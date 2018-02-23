import requests
import json
import commands
import re

def get_hostname():
    hostname = commands.getoutput("hostname")
    return hostname
    
def get_interface():
    cmd = "ip a | grep global | grep brd | grep -v ':' "
    ethinfo = commands.getoutput(cmd).split('\n')
    iface = []
    for i in ethinfo:
        ip = i.split()[1].split('/')[0]
        ifname = i.split()[6]
        local = '^((192\.168\.)|(10\.)|(172\.([1-2][0-9]|31\.)))'
        if re.match(local,ip):
            iface.append({"macro":'{$LOCAL_IF}',"value":str(ifname)})
        else:
            iface.append({"macro":'{$PUBLIC_IF}',"value":str(ifname)})
    return iface

def get_token():    
    url = "http://120.26.101.74:1043//zabbix/api_jsonrpc.php"
    headers = {"Content-Type": "application/json-rpc"}
    data = {
        "jsonrpc": "2.0",
        "method": "user.login",
        "params": {
            "user": "admin",
            "password": "ZBX4topvdn"
            },
        "id": 1,
        "auth": None
        }
        
    req = requests.post(url,data = json.dumps(data),headers = headers)
    res = json.loads(req.text)
    token = res['result']
    return token

def get_hostid(hostname,token):
    url = "http://120.26.101.74:1043//zabbix/api_jsonrpc.php"
    headers = {"Content-Type": "application/json-rpc"}
    data = {
        "jsonrpc": "2.0",
        "method": "host.get",
        "params": {
            "output": "extend",
            "filter": {
                "host": [
                    hostname
                ]
            }
        },
        "auth": token,
        "id": 1
    }
    req = requests.post(url,data = json.dumps(data),headers = headers)
    res = json.loads(req.text)
    hostid = res['result'][0]['hostid']
    return hostid
    
def change_if(hostid,info,token):
    url = "http://120.26.101.74:1043//zabbix/api_jsonrpc.php"
    headers = {"Content-Type": "application/json-rpc"}
    data = {
        "jsonrpc": "2.0",
        "method": "host.update",
        "params": {
            "hostid": hostid,
            "macros": info
        },
        "auth": token,
        "id": 1
    }
    
    req = requests.post(url,data = json.dumps(data),headers = headers)
    res = json.loads(req.text)
    return res
    

if __name__ == '__main__':
    hostname = get_hostname()
    token = get_token()
    info = get_interface()
    hostid = get_hostid(hostname,token)
    res = change_if(hostid,info,token)
    print res
