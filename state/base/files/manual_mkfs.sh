#!/bin/sh

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

test $# -ne 1 && echo "Please type devices!" && exit 2
var="$1"

parted -s "${var}" mklabel gpt
parted -s "${var}" mkpart primary 1 30G
parted -s "${var}" mkpart primary 30G 70G
parted -s "${var}" mkpart primary 70G 4001G
parted "${var}" print
mkfs.ext4 -F -T largefile -O flex_bg -G 64 "${var}"1
mkfs.ext4 -F -T largefile -O flex_bg -G 64 "${var}"2
mkfs.ext4 -F -T largefile -O flex_bg -G 64 "${var}"3
