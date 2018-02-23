#!/bin/bash

mkdir -p /tmp/slice

if grep '/tmp/slice' /etc/fstab > /dev/null 2>&1;
then
    true
else
    cat >> /etc/fstab << EOF
tmpfs  /tmp/slice  tmpfs  defaults,size=8192m  0  0
EOF
fi
