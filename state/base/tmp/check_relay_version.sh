#!/bin/bash

check_nginx_num=$(ps -e faux|egrep nginx|egrep -v grep|egrep '\-p'|egrep -v -i conginx|egrep -v opt|egrep -v nginx1|wc -l)

echo -e "port : [80]"
curl -L http://127.0.0.1/stat 2>/dev/null|egrep "nginx_rtmp_version"
if [ $check_nginx_num -eq 3 ];then
    echo -e "port : [81]"
    curl -L http://127.0.0.1:81/stat 2>/dev/null|egrep "nginx_rtmp_version"
    echo -e "port : [82]"
    curl -L http://127.0.0.1:82/stat 2>/dev/null|egrep "nginx_rtmp_version"
    echo -e "port : [83]"
    curl -L http://127.0.0.1:83/stat 2>/dev/null|egrep "nginx_rtmp_version"
    echo -e "port : [84]"
    curl -L http://127.0.0.1:84/stat 2>/dev/null|egrep "nginx_rtmp_version"
fi


