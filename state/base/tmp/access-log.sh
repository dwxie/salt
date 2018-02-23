#!/bin/bash


WORK_DIR="/opt/nginx-tool/logs"
DAILY=7

#Clean the overtime log or gz.
find $WORK_DIR -atime +$DAILY -name *.log
find $WORK_DIR -atime +$DAILY -name *.gz

for log in `find $WORK_DIR -atime +1 -name *.log`
do
    tar -zcvf ${log}.gz $log
    rm -rf $log
done
    
