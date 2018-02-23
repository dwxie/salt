#!/bin/bash

now_path=$(cd `dirname $0` && pwd)

ulimit -SHn 100001

if ! grep "ulimit -c unlimited" /etc/profile > /dev/null 2>&1
then
    echo "ulimit -c unlimited" >> /etc/profile
fi
source /etc/profile

#增加多一个判断，防止路径不一定是/opt/nginx-tool/sbin时出错
if [ $now_path == "/opt/nginx-tool/sbin" ];then
    cd /opt/nginx-tool/sbin
else
    cd $now_path
fi
if [ ! -f "nginx" ];then
    echo -e "Sorry. no nginx executable found. EXIT NOW.."
    exit 2
fi

killall nginx
chmod +x nginx
export LD_LIBRARY_PATH=LD_LIBRARY_PATH:.
./nginx -p ../
