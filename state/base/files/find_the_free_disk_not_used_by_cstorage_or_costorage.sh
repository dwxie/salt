#!/bin/bash

if [ $(id -u) -ne 0 ];then
    echo -e "Please run me as root"
    exit 2
fi

free_disk_filter="/tmp/free_disk_filter.txt"
all_wwn_disk="/tmp/all_wwn_disk.txt"

cs_config="/opt/storage/storage.conf"
cos_config="/opt/COStorage/storage.conf"

sys_disk=$(df -ahT|column  -t|egrep '/$'|awk '{print $1}'|awk -F'/' '{print $NF}')

if [ -f "$cs_config" ];then
    cat $cs_config |egrep -o "wwn-[0-9a-z]*-part[0-9]"|awk -F'-' '{print $2}'|sort -V|uniq |sort -V > $free_disk_filter
fi
if [ -f "$cos_config" ];then
    cat $cos_config |egrep -o "wwn-[0-9a-z]*-part[0-9]"|awk -F'-' '{print $2}'|sort -V|uniq |sort -V >> $free_disk_filter
fi

if [ -d "/dev/disk/by-id/" ];then
    ls -l /dev/disk/by-id/wwn-*|egrep -v "$sys_disk"|awk -F'->' '{print $1}'|awk '{print $NF}'|egrep -o "wwn-[0-9a-z]*-part[0-9]"|awk -F'-' '{print $2}'|sort -V|uniq |sort -V > $all_wwn_disk
    N2=$(cat $all_wwn_disk|wc -l)
    if [ $N2 -eq 0 ];then
        echo -e "Found 0 wwn disks"
        exit 3
    fi
    for one_disk in `cat $free_disk_filter`
    do
        N1=$(cat $all_wwn_disk|egrep $one_disk|wc -l)
        if [ $N1 -eq 1 ];then
            #echo -e "Need to remove this disk cause it's useing [$one_disk]"
            sed -i "s/$one_disk/###/" $all_wwn_disk
        fi
    done
    N3=$(cat $all_wwn_disk|egrep -v "###"|egrep -v "^$"|wc -l)
    if [ $N3 -eq 0 ];then
        echo -e "No free disk on this machine"
        exit 3
    elif [ $N3 -gt 1 ];then
        the_free_disk_list=$(cat $all_wwn_disk|egrep -v "###"|egrep -v "^$")
        for the_free_disk in $the_free_disk_list
        do
            the_free_disk_dev=$(ls -l /dev/disk/by-id/|egrep "${the_free_disk} "|awk '{print $NF}'|awk -F'/' '{print $NF}')
            disk_size=$(fdisk  -l /dev/$the_free_disk_dev 2>/dev/null|egrep ^Disk|egrep -v identi|awk -F',' '{print $1}')
            echo -e "$the_free_disk __ $the_free_disk_dev __ $disk_size"
        done
    else
        the_free_disk=$(cat $all_wwn_disk|egrep -v "###"|egrep -v "^$")
        the_free_disk_dev=$(ls -l /dev/disk/by-id/|egrep "${the_free_disk} "|awk '{print $NF}'|awk -F'/' '{print $NF}')
        disk_size=$(fdisk  -l /dev/$the_free_disk_dev 2>/dev/null|egrep ^Disk|egrep -v identi|awk -F',' '{print $1}')
        echo -e "$the_free_disk __ $the_free_disk_dev __ $disk_size"
    fi
else
    echo -e "Sorry..Maybe this OS is not supported..[I cant find the /dev/disk/by-id/ dir]"
    exit 2
fi
if [ -f "$free_disk_filter" ];then
    rm $free_disk_filter
fi
if [ -f "$all_wwn_disk" ];then
    rm $all_wwn_disk
fi

