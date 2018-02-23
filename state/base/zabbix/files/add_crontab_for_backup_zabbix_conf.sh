#!/bin/bash

if grep 'backup_zabbix_conf.sh' /etc/crontab;
then
    exit 0
else
    cat >> /etc/crontab << EOF

# Add zabbix backup conf everyday 03:00
0 3 * * * root bash /opt/sa_tools/scripts/sh/backup_zabbix_conf.sh
EOF
fi
