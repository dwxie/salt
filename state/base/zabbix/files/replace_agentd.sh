#! /bin/bash

agent=`ps -ef | grep -v grep | grep '/usr/local/bin/zabbix_agentd' | wc -l`
if [ $agent -ne 0 ]; then
    echo "zabbix_agentd is running."
    exit 0
fi 
#Stop the old zabbix-agent
service zabbix-agent stop

sleep 5s

#Start the new zabbix-agent
/usr/local/bin/zabbix_agentd 
#Check the process
ps -ef | grep zabbix_agentd
#
apt-get remove zabbix-agent -y

exit 0
