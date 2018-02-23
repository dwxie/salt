#!/bin/bash

if [ -d "/usr/local/services/zabbix/etc" ];then
    mkdir -p /backup/zabbix/`date +%F_%T`
    cp -a /usr/local/services/zabbix/etc /backup/zabbix/`date +%F_%T`/
fi

