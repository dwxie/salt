#!/bin/bash

cwd_dir=$(cd `dirname $0` && pwd)
cd $cwd_dir

etc_num=$(ls etc/indexserver-*.ini|sort -V|wc -l)
indexserver_num=$(ps -e faux|egrep -w './indexserver'|egrep -v grep|egrep -v restart.sh|wc -l)

if [ $indexserver_num -ne $etc_num ];then
    echo -e "Sorry..The actual indexserver process num is not the same with indexserver-*.ini"
    echo -e "ps: $indexserver_num ls: $etc_num"
    echo -e "Please check"
    exit 1
fi

echo -e "\nBefore Killing indexserver\n"
ps -e faux|egrep -w './indexserver'|egrep -v grep|egrep -v restart.sh|sort -V -k 12|column  -t
killall indexserver
sleep 15
echo -e "\nAfter killing\n"
ps -e faux|egrep -w './indexserver'|egrep -v grep|egrep -v restart.sh|sort -V -k 12|column  -t
if [ ! -f "indexserver" ];then
    echo -e "Sorry..No indexserver found."
    exit 1
fi
if [ ! -x "indexserver" ];then
    chmod +x ./indexserver
fi
ulimit -SHn 1000000
for i in `ls etc/*|egrep indexserver-[0-9]+.ini|sort -V`
do
    ./indexserver $i >/dev/null 2>&1 &
done

echo -e "\nAfter Restarted indexserver\n"
ps -e faux|egrep -w './indexserver'|egrep -v grep|egrep -v restart.sh|sort -V -k 9|column   -t


echo -e "=== Please check if previous indexserver process not killed clear.. ===="
echo -e "=== check the process start time to identify ==="
