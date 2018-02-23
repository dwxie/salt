#!/bin/bash

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
#sysdisk=`fdisk -l |grep -w |awk '{print $1}'|sed 's/[0-9].*//'|sed -n -e '$p'`
sysdisk=`df -h|grep "/$"|sed 's/[0-9].*//g'`
parteddisk=`fdisk -l | grep "Disk /dev/s" | grep -v "$sysdisk" | awk '{print $2}' | sed 's/://' | sed 's/\/dev\///' | sed -n -e '1,$p' | sort`

i="${1:-1}"

echo "${parteddisk}" | while read disk
do
    wwn=$(ls -l /dev/disk/by-id/ | grep "${disk}" | grep -v "part" | grep "wwn"  | awk '{print $(NF-2)}' | sed 's/wwn-//')
    echo "    -"
    echo "      enable: 1"
    echo "      automount: 1"
    echo "      fs_type: 'ext4'"
    echo "      wwn: '${wwn}'"
    echo "      server_port: $((9000 + $i))"
    i=$(($i + 1))
done
