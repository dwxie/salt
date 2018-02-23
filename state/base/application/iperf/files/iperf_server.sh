#!/bin/bash

date=`date +'%Y-%m-%d'`
logdir='/backup/script/iperf_test/'

############start server#######
n=0
while [ 1 ]
do
    #port=`netstat -tlunp|grep iperf` 
    #port=`ps -ef|grep "iperf -s"|grep -v grep`
    #stat=`echo $?`
    #proc_num=`netstat -tlunp|grep iperf|grep -v grep|wc -l`
    proc_num=`ps -ef|grep "iperf -s"|grep -v grep|wc -l`
    if [ $proc_num -eq 0 ];then
        iperf -s >> ${logdir}${date}'.log' &
        chmod 777 ${logdir}${date}'.log'
        n=`expr $n + 1`
        
    elif [ $proc_num -ge 2 ];then
        #netstat -tlunp|grep iperf |awk     -F'[/ ]*' '{print $7}'
        pkill -9 iperf
        sleep 5
        iperf -s >> ${logdir}${date}'.log' &
        chmod 777 ${logdir}${date}'.log'
        n=`expr $n + 1`
    else
        break
    fi
done

sleep 10m
pkill -9 iperf
