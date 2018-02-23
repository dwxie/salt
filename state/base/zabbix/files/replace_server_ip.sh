#! /bin/bash

#Change the configuration
serverip='223.202.103.146'
sed -i "/Server=/c Server=${serverip}" /usr/local/services/zabbix-3.0.3/etc/zabbix_agentd.conf
sed -i "/ServerActive=/c ServerActive=${serverip}" /usr/local/services/zabbix-3.0.3/etc/zabbix_agentd.conf

exit 0
