#!/bin/bash

sed -i '/connections/d' /usr/local/services/zabbix/etc/zabbix_agentd.conf.d/topvdn.conf
if grep 'connections' /usr/local/services/zabbix/etc/zabbix_agentd.conf.d/topvdn.relay.conf > /dev/null 2>&1;
then
    exit 0
else
    cat >> /usr/local/services/zabbix/etc/zabbix_agentd.conf.d/topvdn.relay.conf << EOF
UserParameter=connections[*],sudo /backup/script/get_connections.py \$1
EOF
fi
