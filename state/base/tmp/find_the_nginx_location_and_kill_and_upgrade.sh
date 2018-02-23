#!/bin/bash

check_nginx_path="/opt/nginx-tool/sbin/nginx"
md5_upgrade="05690d3b562e4caaab5b6bcda844e788"
upgrade_sbin_path="/usr/local/src/nginx"

if [ -f "$check_nginx_path" ];then
    md5=$(md5sum $check_nginx_path)
    if [ "$md5" == "$md5_upgrade" ];then
        echo -e "Maybe already upgraded. Please check."
        exit 1
    fi
fi

PIDS=$(ps -e faux|egrep nginx|egrep -v "(grep|\\\_)"|awk '{print $2}')
for i in ${PIDS}
do
    echo -e "pid is $i"
    netstat -antplue|egrep -i listen --col|sort -t'/' -k2 -V|egrep " ${i}/"
done

PIDS=$(ps -e faux|egrep "nginx: master"|egrep -v grep|egrep -v '\\\_'|awk '{print $2}')
for i in ${PIDS}
do
    echo "pid is $i"
    #continue
    real_path=$(ls -al /proc/$i/|egrep '\->'|egrep exe|awk '{print $NF}'|column -t)
    echo $real_path
    work_dir=$(echo ${real_path%/*})
    exe_sbin=$(echo ${real_path##*/})
    #kill -9 $i
    #sleep 2
    #N=$(ps -e faux|egrep "nginx: master"|egrep $i|wc -l)
    #if [ $N -eq 0 ];then
    #    echo -e "Kill successfully"
    #else
    #    echo -e 'Kill Failed'
    #    ps -e faux|egrep "nginx: master"|egrep -v grep|egrep -v '\\\_'
    #    echo -e "==============================================="
    #    exit 1
    #fi
    rsync -azvrP $upgrade_sbin_path $real_path
    chmod +x $real_path
    cd $work_dir && ./s1.sh
    #cd $work_dir && ./${exe_sbin} -p ../ >/dev/null 2>&1 &
    sleep 3
    ps -e faux|egrep "nginx: master"|egrep -v grep|egrep -v '\\\_'
    echo -e "==============================================="
done
