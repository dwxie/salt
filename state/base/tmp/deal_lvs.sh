#!/bin/bash
#

VIP=192.168.2.2
logfile=/var/log/keepalived.log
real_server_list=( 192.168.2.75 192.168.2.78 192.168.2.79 192.168.2.93 )

check_if_the_primary_node(){
    echo `date` >>$logfile 
    
    status=`/etc/init.d/keepalived status | grep Active | awk '{print $2}'`
    if [ $status == 'inactive' ];then
        echo -en "keepalived dead\t" >>$logfile
        exit 2
    elif [ $status == 'active' ];then
        echo -en "keepalived alived\t" >>$logfile
    fi

    tail -n 100 /var/log/syslog | grep 'VRRP_Instance'
    retval1=$?
    if [ $retval1 == 0 ];then
        tail -n 100 /var/log/syslog | grep 'VRRP_Instance' | tail -n 1 | grep 'MASTER'
        retval2=$?
        if [ $retval2 == 0 ];then
            echo -en "The state of this node is MASTER\t" >> $logfile
            /sbin/ipvsadm -C
            echo -en "now add the ipvsadm rules\n" >>$logfile
            add_ipvs_rules
        else
            tail -n 100 /var/log/syslog | grep 'VRRP_Instance' | tail -n 1 | grep 'SLAVE'
            retval3=$?
            if [ $retval3 == 0 ];then
                echo -en "The state of this node has changed to SLAVE\t" >> $logfile
                check_ipvs_rule
                retval4=$?
                if [ $retval4 == 1 ];then
                    echo -en " now clean the ipvsadm rules\n" >>$logfile
                    /sbin/ipvsadm -C
                fi
            fi
        fi
    else
        echo -en "there is no change for keepalived recently\n" >> $logfile
    fi
}

check_ipvs_rule(){
    check==`/sbin/ipvsadm -Ln | grep $VIP`
    if [ $check != "" ];then
        echo "ipvs rule exists in this node" >>$logfile 
        return 1
    fi
}

check_keepalived_config(){
    state=`cat /etc/keepalived/keepalived.conf | grep state | awk '{print $2}'`
    if [ $state == "master" ];then
        echo "config file for keepalied is master" >> $logfile
        return 
    elif [ $state == "backup" ];then
        echo "config file for keepalied is backup" >> $logfile
    else 
        echo "config file worng !!!"
        exit 3
    fi
}

add_ipvs_rules(){
    /sbin/ipvsadm -A -t $VIP:8004 -s rr
    /sbin/ipvsadm -A -t $VIP:1935 -s rr
    for i in ${read_server_list[*]};
    do
        /sbin/ipvsadm -a -t $VIP:8004 -r ${i}:8004 -g
        /sbin/ipvsadm -a -t $VIP:1935 -r ${i}:1935 -g
    done
}

check_if_the_primary_node
check_keepalived_config

