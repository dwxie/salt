#!/bin/bash

SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"
cd $SCRIPT_PATH

jump1_domain="jump1.topvdn.com"
jump2_domain="jump2.topvdn.com"
#jump1_domain="ip138.com"
a_must_ip="42.51.7.46"

allow_ssh_port="10022"
iptables_bin=$(which iptables)
prot="tcp"

date_point="`date +%H:%M`"
log_file="$SCRIPT_PATH/make_sure_only_jump_can_login.log"
if [ "$date_point" == "01:05" ];then
    rm -rf $log_file
    echo -e "[`date +%F_%T`]I hava deleted log_file $log_file" >> $log_file
fi

function check_this_ip()
{
    local allow_ip="$1"
    N=$($iptables_bin -t filter -L INPUT -vn|egrep -v "Chain"|egrep -v "pkts"|egrep $allow_ip|egrep "${allow_ssh_port}"|egrep "$prot"|egrep ACCEPT|wc -l)
    if [ $N -ge 1 ];then
        echo -e "Arelay allowed ip $allow_ip to ssh login to my port $allow_ssh_port"
        echo -e "[`date +%F_%T`]Arelay allowed ip $allow_ip to ssh login to my port $allow_ssh_port" >> $log_file
    else
        echo -e "I need to allow this ip $allow_ip too ssh login to my port $allow_ssh_port"
        echo -e "[`date +%F_%T`]I need to allow this ip $allow_ip too ssh login to my port $allow_ssh_port" >> $log_file
        $iptables_bin -t filter -I INPUT 1 -s $allow_ip -p tcp --dport $allow_ssh_port -j ACCEPT
    fi
}

function ban_all_other_ip_to_ssh_to_me()
{
    N1=$($iptables_bin -t filter -L INPUT -vn| egrep -v "Chain"|egrep -v "pkts"|egrep $allow_ssh_port|egrep "DROP"|wc -l)
    if [ $N1 -ge 1 ];then
        echo -e "Already baned other ip to ssh login to my port $allow_ssh_port"
        echo -e "[`date +%F_%T`]Already baned other ip to ssh login to my port $allow_ssh_port" >> $log_file
    else
        echo -e "I need to ban other ip to ssh login to my port $allow_ssh_port"
        echo -e "[`date +%F_%T`]I need to ban other ip to ssh login to my port $allow_ssh_port" >> $log_file
        $iptables_bin -t filter -A INPUT -p tcp --dport $allow_ssh_port -j DROP
    fi
}

ips=$(nslookup ${jump1_domain}|egrep Address|egrep -v '#53'|awk -F':' '{print $2}'|column  -t)
if [ "$ips" == "" ];then
    N2=$($iptables_bin -t filter -L INPUT -vn| egrep -v "Chain"|egrep -v "pkts"|egrep $a_must_ip|egrep "ACCEPT"|wc -l)
    if [ $N2 -lt 1 ];then
        echo -e "Oh.God. No ip point to domain $jump1_domain   .. So I Have to make sure ly-saltstack can login ip[$a_must_ip]"
        echo -e "[`date +%F_%T`]Oh.God. No ip point to domain $jump1_domain   .. So I Have to make sure ly-saltstack can login ip[$a_must_ip]" >> $log_file
        $iptables_bin -t filter -I INPUT -s $a_must_ip -p tcp --dport $allow_ssh_port -j ACCEPT
    else
        echo -e "Oh.God. No ip point to domain $jump1_domain   ..Already Have allowed ly-saltstack can login ip[$a_must_ip]"
        echo -e "[`date +%F_%T`]Oh.God. No ip point to domain $jump1_domain   ..Already Have allowed ly-saltstack can login ip[$a_must_ip]" >> $log_file
    fi
fi
for ip in $ips
do
    check_this_ip $ip
done
ips=$(nslookup ${jump2_domain}|egrep Address|egrep -v '#53'|awk -F':' '{print $2}'|column  -t)
if [ "$ips" == "" ];then
    N2=$($iptables_bin -t filter -L INPUT -vn| egrep -v "Chain"|egrep -v "pkts"|egrep $a_must_ip|egrep "ACCEPT"|wc -l)
    if [ $N2 -lt 1 ];then
        echo -e "Oh.God. No ip point to domain $jump2_domain   .. So I Have to make sure ly-saltstack can login ip[$a_must_ip]"
        echo -e "[`date +%F_%T`]Oh.God. No ip point to domain $jump2_domain   .. So I Have to make sure ly-saltstack can login ip[$a_must_ip]" >> $log_file
        $iptables_bin -t filter -I INPUT -s $a_must_ip -p tcp --dport $allow_ssh_port -j ACCEPT
    else
        echo -e "Oh.God. No ip point to domain $jump2_domain   ..Already Have allowed ly-saltstack can login ip[$a_must_ip]"
        echo -e "[`date +%F_%T`]Oh.God. No ip point to domain $jump2_domain   ..Already Have allowed ly-saltstack can login ip[$a_must_ip]" >> $log_file
    fi
fi
for ip in $ips
do
    check_this_ip $ip
done
######################## allow ips for our network
our_network="223.202.103.0/24 42.51.12.0/24 42.51.7.0/24 122.226.182.0/24 122.226.181.0/24 61.55.189.0/24 103.38.42.0/24 183.57.151.0/24 192.168.2.0/24 127.0.0.1"
for i in $our_network
do
    #echo $i
    check_this_ip $i
done
########################
ban_all_other_ip_to_ssh_to_me
echo -e "---------------------------------------------------------------------------" >> $log_file
