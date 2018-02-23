#!/bin/bash

if grep 'Add snapshot check' /etc/crontab;
then
    echo -e "Found add snapshot"
    exit 0
else
    if grep 'added by tib for node_check.py' /etc/crontab;
    then
        echo -e "Found added by tib"
        exit 0
    else
        echo -e "Need to add to crontab"
        cat >> /etc/crontab << EOF

# Add snapshot check
* * * * *   root  cd /opt/sa_tools/scripts/py/ && python node_check.py
EOF

    sed -i -e '16,${/^$/d}' -e '16,${/^#/{x;p;x}}' /etc/crontab
    fi
fi
