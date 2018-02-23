#!/bin/bash
#
size=$1
time=$2

if [ $# -ne 2 ];then
        echo -e Usage: $0 capture_size time_of_check
        exit 1
fi

ip_Pub=`curl -q http://members.3322.org/dyndns/getip 2>/dev/null`
net_Num=`ifconfig | egrep -B1 $ip_Pub | awk '/Ethernet/{print $1}'`
tcpdump -vv -p tcp -c 100000 -s $size -i $net_Num dst port 1935 >/tmp/tcpdump 2>/dev/null &

sleep $time

total=`cat /tmp/tcpdump | wc -l`
total_num=`expr $total / 2`
incorrect=`cat /tmp/tcpdump | grep incorrect | wc -l`
rate=`echo $incorrect $total_num| awk '{printf "%.2f\n",$1/$2}'`

killall tcpdump

echo "=============================="
echo -e 'The total number is: '$total_num
echo -e 'The incorrect number is: '$incorrect
echo -e 'The rate is: '$rate

