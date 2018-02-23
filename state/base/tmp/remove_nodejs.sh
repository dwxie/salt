#!/bin/bash

if [ -f /opt/nvm/nvm.sh ];
then
    export HOME=/root
    source /opt/nvm/nvm.sh

    pm2 delete www
    pm2 delete snapWatcher

    service pm2-init.sh stop
    update-rc.d -f pm2-init.sh remove
    npm uninstall -g pm2
fi

sed -i '/\/opt\/nvm\/nvm.sh/d' ~/.bashrc
rm -rf /opt/nvm ~/.pm2 ~/.npm
rm -f /etc/init.d/pm2-init.sh


sed -i -e '/# Start liveManager Server/,+5d' /etc/rc.local

sed -i -e '16,${/^$/d}' -e '16,${/^#/{x;p;x}}' /etc/crontab
sed -i -e '/# Add jpg check/,+1d' /etc/crontab
sed -i -e '/# Add nodejs check/,+2d' /etc/crontab
sed -i -e '/\/backup\/script\/get_connections.py/d' /etc/crontab
sed -i -e '/access-log.sh/d' /etc/crontab
sed -i -e '/node_restart.py/d' /etc/crontab
sed -i -e '/#added by tib for snapshot_delay.sh/,+1d' -e '/#added by tib for node_delay.sh/,+1d' /etc/crontab
sed -i -e '/# Added by zhangjingqiu for remove_ram_data/,+1d' /etc/crontab
sed -i -e '16,${/^$/d}' -e '16,${/^#/{x;p;x}}' /etc/crontab
