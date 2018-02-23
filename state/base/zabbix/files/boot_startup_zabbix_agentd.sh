#!/bin/bash

if grep 'Start Zabbix Agentd' /etc/rc.local > /dev/null 2>&1;
then
    exit 0
else
    sed -i '/exit 0/d' /etc/rc.local
    cat >> /etc/rc.local << EOF

# Start Zabbix Agentd
/usr/local/services/zabbix/sbin/zabbix_agentd -c /usr/local/services/zabbix/etc/zabbix_agentd.conf >/dev/null 2>&1 &
exit 0
EOF
fi
