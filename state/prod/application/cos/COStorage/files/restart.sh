#!/bin/bash

cwd_path=$(cd `dirname $0` && pwd)
cd $cwd_path

if [ ! -d "/opt/COStorage" ];then
    echo -e "No /opt/COStorage found..exit now"
    exit 2
fi

if [ -f "start.sh" -a -f "stop.sh" ];then
    echo -e "found start.sh and stop.sh"
    N=$(ps -e faux|egrep -i costorage|egrep -v grep|wc -l)
    ppid_to_kill=$(ps -e faux|egrep COStorage|egrep -v grep|egrep -v '\\\_'|awk '{print $2}')
    echo -e "ppid to kill $ppid_to_kill"
    #bash ./stop.sh
    kill $ppid_to_kill
    sleep 2
    N1=$(ps -e faux|egrep -i costorage|egrep -v grep|wc -l)
    if [ $N1 -gt 0 ];then
        echo -e "Try stop.sh again"
        ppid_to_kill=$(ps -e faux|egrep COStorage|egrep -v grep|egrep -v '\\\_'|awk '{print $2}')
        echo -e "ppid to kill $ppid_to_kill"
        #bash ./stop.sh
        kill $ppid_to_kill
        sleep 2
        #bash ./stop.sh
        N2=$(ps -e faux|egrep -i costorage|egrep -v grep|wc -l)
        if [ $N2 -gt 0 ];then
            echo -e "Exit now..stop.sh failed twice"
            exit 2
        else
            sleep 5
            bash ./start.sh > /tmp/start_cos.log 2>&1 &
            sleep 30
            cat /tmp/start_cos.log
            N_last=$(ps -e faux|egrep -i costorage|egrep -v grep|wc -l)
            if [ $N -eq $N_last ];then
                echo -e "------"
                netstat -antplue|egrep -i listen --col|egrep -i costorage |sort -V -k3
                echo -e "------"
                echo -e "start.sh successful"
            else
                echo -e "Sorry..Failed"
                exit 1
            fi
        fi
    else
        sleep 5
        bash ./start.sh > /tmp/start_cos.log 2>&1 &
        sleep 30
        cat /tmp/start_cos.log
        N_last=$(ps -e faux|egrep -i costorage|egrep -v grep|wc -l)
        if [ $N -eq $N_last ];then
            echo -e "------"
            netstat -antplue|egrep -i listen --col|egrep -i costorage |sort -V -k3
            echo -e "------"
            echo -e "start.sh successful"
        else
            echo -e "Sorry..Failed"
            exit 1
        fi
    fi
else
    echo -e "Not found start.sh or stop.sh"
    exit 2
fi


