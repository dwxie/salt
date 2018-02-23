#!/bin/bash

if grep 'Start codispatcher Server' /etc/rc.local > /dev/null 2>&1;
then
    exit 0
else
    sed -i '/exit 0/d' /etc/rc.local
    cat >> /etc/rc.local << EOF

# Start codispatcher Server
/opt/codispatcher/start.sh
exit 0
EOF

    sed -i -e '/^$/d' -e '/# Start /{x;p;x}' /etc/rc.local
fi
