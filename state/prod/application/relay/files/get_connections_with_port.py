#!/usr/bin/env python
# -*- coding: utf-8 -*-

import commands
import json
import math
import os
import socket
import sys
import urllib2

# [global]
SCRIPT_PATH = os.path.dirname(os.path.abspath(__file__))
SCRIPT_NAME = os.path.basename(__file__)


def run_shell_command_2(command_string):
    from subprocess import Popen,PIPE
    cmd = "%s" % command_string.strip()
    p = Popen(cmd,shell=True,stdout=PIPE,stderr=PIPE)
    out,err = p.communicate()
    if p.returncode == 0:
        return ("ok",out.rstrip(),err.rstrip())
    else:
        return ("problem",out.rstrip(),err.rstrip())

class GetConnections():
    def __init__(self, url, data = None, timeout = None , port = None):
        self.items = {
                'hostname' : 'unknown',
                'peer_id' : 0,
                'max_download' : 0,
                'used_download' : 0,
                'available_upload' : 0,
                'available_download' : 0,
                'MaxUploadConnection' : 0,
                'MaxDownloadConnection' : 0,
                'upload' : 0,
                'download' : 0,
                }
        self.url = url
        self.data = data
        self.timeout = timeout
        self.port = port
        self.config_file = None

    def hostname(self):
        self.items['hostname'] = socket.gethostname()
        return self

    def request(self):
        """
        Request the status of connections of relayers.
        """
        xml = urllib2.urlopen(self.url, self.data, self.timeout).read()
        if int(xml.count('name')) >= 0:
            self.items['used_download'] = int(xml.count('name'))/2 - 1
        self.items['download'] = self.items['used_download']
        return self

    def extract_from_config(self):
        """
        Get the information of Nginx configuration.
        """
        self.config_file = self.get_the_right_config(self.port)
        config_data = self.loads(self.read_file(self.config_file))
        for k,v in {'max_download': 'max_download_connections', 'peer_id': 'peer_id'}.items():
            self.items[k] = int(config_data['connection_config'][v])
        self.items['MaxDownloadConnection'] = self.items['max_download']
        return self

    def calculate(self):
        self.items['available_download'] = self.items['max_download'] - self.items['used_download']
        return self

    def loads(self, str):
        return json.loads(str)

    def read_file(self, file):
        """
        Read content from file.
        """
        fd = open(file)
        data = fd.read()
        fd.close()
        return data

    def get(self, item):
        data = self.items
        return {
            'hostname': data['hostname'],
            'peer_id': data['peer_id'],
            'max_download': data['max_download'],
            'used_download': data['used_download'],
            'available_download': data['available_download'],
            'MaxUploadConnection': data['MaxUploadConnection'],
            'MaxDownloadConnection': data['MaxDownloadConnection'],
            'upload_connections': data['upload'],
            'down_connections': data['download'],
            'available_upload': data['available_upload'],
            'all': data
        }[item]

    def get_the_right_config(self, port):
        ret1 = run_shell_command_2("""sudo lsof -i :%s | grep LISTEN | sed -n 1p | awk '{print $2}'""" % port)
        if ret1[0] == "ok":
            pid = int(ret1[1])
        else:
            pid = None
        ret2 = run_shell_command_2("""sudo ls -al /proc/%s/ | egrep cwd | awk '{print $NF}'""" % pid)
        if ret2[0] == "ok":
            real_config_path = "%s/config.json" % str(ret2[1])
        else:
            real_config_path = None
        return real_config_path

if __name__ == '__main__':
    config = {
            'timeout' : 2
            }

    try:
        args_len = len(sys.argv)
        if args_len != 3:
            print 0
            sys.exit(2)
        else:
            port = int(sys.argv[2])
            url = "http://127.0.0.1:%s/stat" % port
            item = sys.argv[1]

        gc_instance = GetConnections(url, None, config['timeout'], port=port)
        value = gc_instance.hostname().request().extract_from_config().calculate().get(item)
        print value
    except Exception,e:
        # when exception, print default value
        #print e
        print 0
