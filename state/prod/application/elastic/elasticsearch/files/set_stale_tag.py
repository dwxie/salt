#!/usr/bin/env python
# -*- coding:utf-8 -*-

from time import strftime, localtime
from datetime import timedelta, date
import requests
import json

def set_state_tag(indeics_prefix, data, stale_day):
    for index_prefix in indeics_prefix:
        url = "http://192.168.2.210:9200/%s%s/_settings" %(index_prefix, stale_day)
        req = requests.put(url,data = json.dumps(data))

def main():
    indeics_prefix = ["ly-log-", "udplog-"]
    data = { "index.routing.allocation.require.tag": "stale" }
    delayday = 10
    stale_day = str(date.today() - timedelta(days = delayday))
    stale_day = stale_day.replace('-','.')
    set_state_tag(indeics_prefix, data, stale_day)

if __name__ == '__main__':
    main()
