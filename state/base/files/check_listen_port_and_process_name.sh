#!/bin/bash

echo -e "--------- Here all [TCP] services -------------------"
for i in `netstat -antplue|egrep  -i listen --col|sort -k2 -V|awk '{print $4}'|awk -F':' '{print $NF}'|sort -V|uniq`
do
    listen_port="$i"
    #echo -e "listen port : $listen_port"
    pid=$(lsof -n -i tcp:$i |egrep -i listen|awk '{print $2}'|sort -V|head -1)
    if [ "$pid" == "" ];then
        #echo -e "No pid found. Continue"
        continue
    fi
    #echo -e "pid : $pid"
    process_name=$(cat /proc/$pid/status|egrep Name|awk '{print $2}')
    echo -e "listen_port:[$listen_port]  process_name:[$process_name]"
done
echo -e "--------- Here all [UDP] services -------------------"
for i in `netstat -antplue|egrep  -i udp|sort -k2 -V|awk '{print $4}'|awk -F':' '{print $NF}'|sort -V|uniq`
do
    listen_port="$i"
    #echo -e "listen port : $listen_port"
    pid=$(lsof -n -i :$i |egrep -i listen|awk '{print $2}'|sort -V|head -1)
    if [ "$pid" == "" ];then
        #echo -e "No pid found. Continue"
        continue
    fi
    #echo -e "pid : $pid"
    process_name=$(cat /proc/$pid/status|egrep Name|awk '{print $2}')
    echo -e "listen_port:[$listen_port]  process_name:[$process_name]"
done
