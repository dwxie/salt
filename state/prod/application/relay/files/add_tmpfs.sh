#!/bin/bash

mkdir -p /tmp/hls
#mkdir -p /ram_data /tmp/hls
#if grep '/ram_data' /etc/fstab > /dev/null 2>&1;
#then
#    true
#else
#    cat >> /etc/fstab << EOF
#tmpfs  /ram_data  tmpfs  defaults,size=256m  0  0
#EOF
#fi

if grep '/tmp/hls' /etc/fstab > /dev/null 2>&1;
then
    true
else
    cat >> /etc/fstab << EOF
tmpfs  /tmp/hls  tmpfs  defaults,size=2048m  0  0
EOF
fi
