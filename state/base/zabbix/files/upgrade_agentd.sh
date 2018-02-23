#! /bin/bash

#Change the configuration
serverip=`cat /etc/zabbix/zabbix_agentd.conf | grep -v '#' | grep Server= | awk -F '=' '{print $2}'`
sed -i "s/127.0.0.1/$serverip/g" /usr/local/services/zabbix-3.0.3/etc/zabbix_agentd.conf
cat  /etc/zabbix/zabbix_agentd.conf | grep UserParameter | grep -v '#' >> /usr/local/services/zabbix-3.0.3/etc/zabbix_agentd.conf.d/topvdn.conf

exit 0
