#!/bin/bash 
#

config_file='/opt/COStorage/storage.conf'
disk=`cat $config_file | grep wwn | awk -F '>' '{print $2}' | awk -F '<' '{print $1}'`

for (( i=1;i<=12;i++ ))
do
    echo "$disk" | awk '{if(NR=='$i')print $0}' | grep "part1" >> /tmp/diskfile
done

for (( i=1;i<=4;i++ ))
do
    disk_var=`cat /tmp/diskfile | awk '{if(NR=='$i')print $0}'`
    disknum=`ls -la $disk_var | awk '{print $11}' | awk -F '/' '{print $3}'  | cut -c1-3`
    echo "/dev/$disknum"
done


