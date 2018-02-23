#!/bin/bash

if grep 'ntpdate.sh' /etc/crontab;
then
    exit 0
else
    cat >> /etc/crontab << EOF

# Add ntpdate task plan
0  * * * *    root bash /backup/shell/ntpdate.sh
30 * * * *    root bash /backup/shell/ntpdate.sh
EOF
fi
