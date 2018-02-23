#!/usr/bin/env python
# -*- coding:utf-8 -*-

import os
import sys
from datetime import timedelta, date, datetime
import requests
import json

# [global]
SCRIPT_PATH = os.path.dirname(os.path.abspath(__file__))
SCRIPT_NAME = os.path.basename(__file__)

class Snapshot(object):
    """docstring for SnapShot"""
    def __init__(self, url, data, timeout):
        self.url = url
        self.data = data
        self.timeout = timeout

    def put_repository(self):
        response = requests.put(self.url, data=json.dumps(self.data), timeout=self.timeout)
        return response

    def get_repository(self):
        response = requests.get(self.url, timeout=self.timeout)
        return response

    def delete_repository(self):
        response = requests.delete(self.url, timeout=self.timeout)
        return response

    def put_snapshot(self):
        response = requests.put(self.url, data=json.dumps(self.data), timeout=self.timeout)
        return response

    def get_snapshot(self):
        response = requests.get(self.url, timeout=self.timeout)
        return response

    def delete_snapshot(self):
        response = requests.delete(self.url, timeout=self.timeout)
        return response

def write_log(log_file, methond, response, data):
    msg = "-*-" * 20 + " " * 4 + methond + " Start " + " " * 4 + "-*-" * 20 + "\n"
    msg = msg + "url: " + str(response.url) + "\n"
    msg = msg + "data:" + str(json.dumps(data, indent=4)) + "\n"
    msg = msg + "status_code: " + str(response.status_code) + "\n"
    msg = msg + "text: " + str(response.text)
    msg = msg + "-*-" * 20 + " " * 4 + methond + " End " + " " * 4 + "-*-" * 20 + "\n"
    with open(log_file, 'a') as f:
        f.write(msg)

def main():
    config = {
        'log_prefix': SCRIPT_PATH + '/logs/',
        'timeout': 30,
        'es_url': 'http://192.168.2.218:9200',
        'delay_days': 3,
        'indeics_prefix': ["ly-log-", "billing-rtmp-", "billing-storage-"],
        'post_data': {
            'max_snapshot_bytes_per_sec': '50mb',
            'max_restore_bytes_per_sec': '100mb',
        },
    }
    data = None
    config['today'] = str(date.today() - timedelta(days = config['delay_days'])).replace('-', '.')
    config['today_fmt'] = (datetime.now() - timedelta(days = config['delay_days'])).strftime('%Y%m%d')
    config['log_file'] = config['log_prefix'] + "snapshot." + str(config['today_fmt']) + ".log"

    # Create folder
    if not os.path.exists(config['log_prefix']):
        os.makedirs(config['log_prefix'])

    # Create repository
    url = "%s/_snapshot/repository_%s?pretty=true" % (config['es_url'], config['today_fmt'])
    data = {
            "type": "fs",
            "settings": {
                "location": "/opt/es_backup/" + str(config['today_fmt']),
                "max_snapshot_bytes_per_sec": config['post_data']['max_snapshot_bytes_per_sec'],
                "max_restore_bytes_per_sec": config['post_data']['max_restore_bytes_per_sec']
            }
        }
    s_ins = Snapshot(url, data, config['timeout'])
    write_log(config['log_file'], 'PUT repository', s_ins.put_repository(), data)

    # Create snapshot
    url = "%s/_snapshot/repository_%s/snapshot?pretty=true" % (config['es_url'], config['today_fmt'])
    indices = (",").join(map(lambda index: "%s%s" % (index, config['today']), config['indeics_prefix']))
    data = {
            "indices": indices,
            "ignore_unavailable": True,
            "include_global_state": False
        }
    s_ins = Snapshot(url, data, config['timeout'])
    write_log(config['log_file'], 'PUT snapshot', s_ins.put_snapshot(), data)

if __name__ == '__main__':
    try:
        main()
    except Exception,e:
        print e
        sys.exit(0)
