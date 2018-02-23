#!/bin/sh

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
#sysdisk=`fdisk -l |grep -w |awk '{print $1}'|sed 's/[0-9].*//'|sed -n -e '$p'`
sysdisk=`df -h|grep "/$"|sed 's/[0-9].*//g'`
parteddisk=`fdisk -l|grep "/dev/s"|grep -v "$sysdisk"|awk '{print $2}'|sed 's/://'|sed -n -e '1,$p'`
for var1 in $parteddisk
do
    parted -s "${var1}" mklabel gpt
    parted -s "${var1}" mkpart primary 1 30G
    parted -s "${var1}" mkpart primary 30G 70G
    parted -s "${var1}" mkpart primary 70G 4001G
    parted "${var1}" print
    mkfs.ext4 -F -T largefile -O flex_bg -G 64 "${var1}"1
    mkfs.ext4 -F -T largefile -O flex_bg -G 64 "${var1}"2
    mkfs.ext4 -F -T largefile -O flex_bg -G 64 "${var1}"3
done
