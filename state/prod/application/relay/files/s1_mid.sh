#!/bin/bash

ulimit -SHn 100001

if ! grep "ulimit -c unlimited" /etc/profile > /dev/null 2>&1
then
    echo "ulimit -c unlimited" >> /etc/profile
fi
source /etc/profile

netstat -antp | grep 1935 | awk '{print $7}' | awk -F '/' '{print $1}' | grep -v '-' | sort | uniq | xargs kill -9
ps -ef | grep nginx | grep cache | grep ' 1 ' | awk '{print $2}' | xargs kill -9

cd /opt/nginx-tool/sbin
export LD_LIBRARY_PATH=LD_LIBRARY_PATH:.
./nginx -p ../
