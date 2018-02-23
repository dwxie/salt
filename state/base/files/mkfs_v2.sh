#!/bin/bash
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

if [ "$(id -u)" != "0" ];then
    echo -e "Please use root to run. I need to fdisk and mkfs ."
    exit 1
fi

if [ $# -ne 2 ];then
    echo -e "Usage:\n\t$0 \"first_partation_size [GB]\" \"second_partation_size [GB]\" "
    exit 1
else
    first_size="$1"
    second_size="$2"
fi

sysdisk=$(df -ahT|column -t|egrep '/$'|awk '{print $1}'|sed 's/[0-9].*$//g')
parteddisk=$(ls /dev/sd*|egrep -v "$sysdisk"|sort -V|egrep -v "[0-9]")

echo -e "=================================="
echo -e "System Disk: $sysdisk \n"
echo -e "Other disks:"
for i in $parteddisk
do
    fdisk  -l $i 2>/dev/null |egrep "^Disk"|egrep -v "identifier"
done
echo -e "=================================="
read -p "Continue ? I will parted and format these disk except System Disk. Please make sure. [y/n]" choice

if [ "$choice" == "y" -o "$choice" == "Y" -o "$choice" == "yes" -o "$choice" == "Yes" ];then
    for var1 in $parteddisk
    do
        echo -e "\n========= Start parted disk and mkfs.ext4 to [$var1] ==========="
        total_size=$(fdisk  -l $var1 2>/dev/null |egrep "^Disk"|egrep -v "identifier"|awk '{print $3}'|cut -d'.' -f1)
        second_1_size=$((first_size + second_size))
        third_size=$((total_size - second_1_size))
        echo -e "first_size: $first_size GB"
        echo -e "second_size: $second_size GB"
        echo -e "third_size: $third_size GB \n"
        sleep 1
        echo -e "mklable gpt"
        parted -s "${var1}" mklabel gpt >/dev/null
        echo -e "mkpart primary 1 ${first_size}G"
        parted -s "${var1}" mkpart primary 1 ${first_size}G >/dev/null
        echo -e "mkpart primary ${first_size}G ${second_1_size}G"
        parted -s "${var1}" mkpart primary ${first_size}G ${second_1_size}G >/dev/null
        echo -e "mkpart primary ${second_1_size}G ${total_size}G"
        parted -s "${var1}" mkpart primary ${second_1_size}G ${total_size}G >/dev/null
        echo -e "\n"
        parted "${var1}" print
        echo -e "------"
        sleep 1
        echo -e "mkfs.ext4 ${var1} 1"
        mkfs.ext4 -F -T largefile -O flex_bg -G 64 "${var1}"1 >/dev/null 2>&1
        echo -e "mkfs.ext4 ${var1} 2"
        mkfs.ext4 -F -T largefile -O flex_bg -G 64 "${var1}"2 >/dev/null 2>&1
        echo -e "mkfs.ext4 ${var1} 3"
        mkfs.ext4 -F -T largefile -O flex_bg -G 64 "${var1}"3 >/dev/null 2>&1
        echo -e "================================================"
    done
else
    echo -e "Bye.."
    exit 1
fi

