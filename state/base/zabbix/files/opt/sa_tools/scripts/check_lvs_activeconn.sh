#!/bin/bash

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

sudo ipvsadm -Ln | grep -w '223.202.103.158:80' -A 3 | sed -n '2,4p' | awk '{if( $5 == 0 ) print $2" ActiveConn:"$5}'
