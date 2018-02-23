#!/bin/bash

if grep 'topvdn.check.file.exists' /usr/local/services/zabbix/etc/zabbix_agentd.conf.d/topvdn.common.conf > /dev/null 2>&1;
then
    exit 0
else
    cat >> /usr/local/services/zabbix/etc/zabbix_agentd.conf.d/topvdn.common.conf << EOF
UserParameter=topvdn.check.file.exists[*],/opt/sa_tools/scripts/check_file_exists.py \$1
EOF
fi
