#!/bin/bash

cwd=`cd $(dirname $0) && pwd`
cd $cwd

log="./check_agentd.log"

N_agentd="`ps -e faux|egrep \"/usr/local/services/zabbix/sbin/zabbix_agentd -c /usr/local/services/zabbix/etc/zabbix_agentd.conf\"|egrep -v "grep"|wc -l`"
echo -e "Agent running num: $N_agentd"
if [ $N_agentd -lt 1 ];then
    echo -e "[`date +%F_%T`]I need start agent cause it is down" >> $log
    /usr/local/services/zabbix/sbin/zabbix_agentd -c /usr/local/services/zabbix/etc/zabbix_agentd.conf >/dev/null 2>&1
    if [ $? -eq 0 ];then
        echo -e "[`date +%F_%T`]I started agentd Successfully" >> $log
        echo -e "[`date +%F_%T`]I started agentd Successfully"
    else
        echo -e "[`date +%F_%T`]I started agentd Failed" >> $log
        echo -e "[`date +%F_%T`]I started agentd Failed"
    fi
else
    echo -e "[`date +%F_%T`] Agentd is running"
fi
