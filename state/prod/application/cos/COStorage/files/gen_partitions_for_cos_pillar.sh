#!/bin/bash

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
file="${1:-wwn.list}"
i="${2:-1}"

if [ $# -ge 1 ];
then
    while read wwn
    do
        echo "        -"
        echo "          enable: 1"
        echo "          automount: 1"
        echo "          fs_type: 'ext4'"
        echo "          wwn: '${wwn}'"
        echo "          upload_port: $((9100 + $i))"
        echo "          query_port: $((8100 + $i))"
        i=$(($i + 1))
    done < "${file}"
else
    sysdisk=`df -h|grep "/$"|sed 's/[0-9].*//g'`
    parteddisk=`fdisk -l | grep "Disk /dev/s" | grep -v "$sysdisk" | awk '{print $2}' | sed 's/://' | sed 's/\/dev\///' | sed -n -e '1,$p' | sort`


    echo "${parteddisk}" | while read disk
    do
        wwn=$(ls -l /dev/disk/by-id/ | grep "${disk}" | grep -v "part" | grep "wwn"  | awk '{print $(NF-2)}' | sed 's/wwn-//')
        echo "        -"
        echo "          enable: 1"
        echo "          automount: 1"
        echo "          fs_type: 'ext4'"
        echo "          wwn: '${wwn}'"
        echo "          upload_port: $((9100 + $i))"
        echo "          query_port: $((8100 + $i))"
        i=$(($i + 1))
    done
fi
