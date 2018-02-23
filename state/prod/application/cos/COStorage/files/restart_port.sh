#!/bin/bash

cwd_path=$(cd `dirname $0` && pwd)
cd $cwd_path

if [ $# -ne 1 ];then
    echo -e "Usage:\n\t$0 \"port\" "
    exit 2
else
    port="$1"
    echo -e "port is $port"
fi

pid_to_kill=$(netstat -antplue|egrep -i listen --col|egrep -i costorage|egrep ":${port}"|awk '{print $NF}'|awk -F '/' '{print $1}')
echo -e "before kill : pid is $pid_to_kill"
netstat -antplue|egrep -i listen --col|egrep -i costorage|sort -V -k3
echo -e ""

kill $pid_to_kill

sleep 10
pid_to_kill=$(netstat -antplue|egrep -i listen --col|egrep -i costorage|egrep ":${port}"|awk '{print $NF}'|awk -F '/' '{print $1}')
echo -e "after kill : pid is $pid_to_kill"
netstat -antplue|egrep -i listen --col|egrep -i costorage|sort -V -k3
echo -e ""

