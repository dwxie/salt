#!/bin/bash

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

if [ $(id -u) -ne 0 ];then
    echo -e "Please use root to run."
    exit 3
fi

if [ $# -eq 1 ];then
    echo -e "OK...I need debug.\n"
    debug="yes"
fi

LANG=en_US:UTF-8
LANGUAGE=en_US:UTF-8

interfaces_file="/etc/network/interfaces"
interfaces_file_1="/etc/network/interfaces_1"
modules_file="/etc/modules"
net_rules_file="/etc/udev/rules.d/70-persistent-net.rules"
macs="$(ifconfig -a|egrep HWaddr|egrep -v bond|awk '{print $NF}'|column -t|sort|uniq|sort -V)"
macs_num="$(ifconfig -a|egrep HWaddr|egrep -v bond|awk '{print $NF}'|column -t|sort|uniq|sort -V|wc -l)"
all_eths=""
num_all_eths=0
default_gw=$(route -n|egrep UG|egrep ^0.0.0.0|awk '{print $2}')
ip1=$(echo $default_gw|cut -d'.' -f1)
ip2=$(echo $default_gw|cut -d'.' -f2)
ip3=$(echo $default_gw|cut -d'.' -f3)
network="${ip1}.${ip2}.${ip3}"
lo_addrs=$(ifconfig -a|egrep lo -A1|egrep inet|awk '{print $2}'|awk -F':' '{print $2}'|egrep -v ^127|sort -V|uniq|sort -V)
lo_for_bond="/tmp/lo_for_bond"
ifconfig -a|egrep lo -A1|egrep inet|awk '{print $2}'|awk -F':' '{print $2}'|egrep -v ^127|sort -V|uniq|sort -V > $lo_for_bond
lo_addrs_num=$(ifconfig -a|egrep lo -A1|egrep inet|awk '{print $2}'|awk -F':' '{print $2}'|egrep -v ^127|sort -V|uniq|sort -V|wc -l)
ipaddr=$(ifconfig -a|egrep $network |awk '{print $2}'|awk -F':' '{print $2}'|sort -V|uniq|sort -V|column -t)
ipaddr_num=$(ifconfig -a|egrep $network |awk '{print $2}'|awk -F':' '{print $2}'|column -t|sort -V|uniq|sort -V|wc -l)
if [ $ipaddr_num -gt 1 ];then
    echo -e "Sorry.I found more than ONE ip addr. It should be only one. Please choose one from below:"
    for i in $ipaddr
    do
        this="no"
        for j in $lo_addrs
        do
            if [ "${i}" == "${j}" ];then
                this="yes"
                break
            fi
        done
        if [ "$this" == "yes" ];then
            continue
        else
            echo -e "$i"
        fi
    done
    read -p "input the ip address you want to choose: " ip
    read -p "You choose $ip.. [yes/no]" co
    if [ "$co0" == "yes" -o "$co0" == "" -o "$co0" == "y" ];then
        echo -e "ok.continue"
    else
        echo -e "bye."
        exit 2
    fi
elif [ $ipaddr_num -eq 0 ];then
    echo -e "Sorry... No ip address found."
    exit 2
fi
another_ips=$(ifconfig |egrep "inet addr"|egrep -v "$ip"|egrep -v 127.0.0.1|awk '{print $2}'|awk -F':' '{print $2}'|column -t|sort -V)
t_f_bond="/tmp/t_f_bond"
ifconfig |egrep "inet addr"|egrep -v "$ip"|egrep -v 127.0.0.1|awk '{print $2}'|awk -F':' '{print $2}'|column -t|sort -V > $t_f_bond
another_ips_num=$(ifconfig |egrep "inet addr"|egrep -v "$ip"|egrep -v 127.0.0.1|awk '{print $2}'|awk -F':' '{print $2}'|column -t|sort -V|wc -l)
netmask=$(ifconfig |egrep $ip|awk -F'Mask:' '{print $2}'|column -t)

if [ "$debug" == "yes" ];then
    echo -e "ipaddr: $ip"
    echo -e "network: $network"
    echo -e "another_ips: $another_ips"
    echo -e "netmask: $netmask"
    echo -e "macs_num: $macs_num"
    echo -e "another_ips_num: $another_ips_num"
    echo -e "lo ipaddress:"
    for i in $lo_addrs
    do
        echo $i
    done
    echo -e "cat /tmp/t_for_bond"
    cat $t_f_bond
    echo -e "cat /tmp/lo_for_bond"
    cat $lo_for_bond
    echo
fi

echo -e "=================="
echo -e "Here I found $macs_num net cards.\n"
for i in $macs
do
    echo -e "$i"
done
echo -e "=================="

echo -e "== Let's check if OS is ubuntu. =="
if [ -f "/etc/os-release" ];then
    egrep -q -i "ubuntu" /etc/os-release
    if [ $? -eq 0 ];then
        echo -e "OK. Ubuntu..Let's Continue\n"
        sleep 1
    else
        echo -e "Sorry..Only ubuntu support now."
        sleep 1
        exit 1
    fi
else
    read -p "Is this Ubuntu? [y/n]" co5
    if [ "$co5" == "yes" -o "$co5" == "" -o "$c05" == "y" ];then
        echo -e "== OK..Let's continue ==\n"
        sleep 1
    else
        echo -e "Sorry.. Only Ubuntu support now."
        exit 1
    fi
fi


backup_file() {
    flag="${1}"
    file="${2}"
    if [ "${flag}" -eq 0 ];
    then
        test -f "${file}" && cp -a "${file}" "${file}_backup_for_bond"
    fi
}

generate_net_rules() {
    echo -e "===================================="
    echo -e "Now I am going to defind the net card names by udev rules"
    sleep 1
    local num=0
    true > "${net_rules_file}"
    for mac in ${macs}
    do
        echo "SUBSYSTEM==\"net\", ACTION==\"add\", ATTR{address}==\"${mac}\", NAME=\"eth${num}\"" >> "${net_rules_file}"
        echo "SUBSYSTEM==\"net\", ACTION==\"add\", ATTR{address}==\"${mac}\", NAME=\"eth${num}\""
        all_eths+="eth${num} "
        num=`expr $num + 1`
    done
    num_all_eths=num
    echo -e "===================================="
}

generate_interfaces() {
    local version="$1"
    echo -e "================================"
    echo -e "Now I am going to do something with bond."
    echo -e "I will deal with some files.. Like : interfaces rc.local /etc/modules"
    sleep 1
    installed_ifenslave=$(dpkg -l|egrep ifenslave|wc -l)
    if [ $installed_ifenslave -ge 1 ];then
        echo -e "already install ifenslave"
    else
        echo -e "apt-get update"
        apt-get update >/dev/null 2>&1
        echo -e "Installing ifenslave"
        apt-get install -y ifenslave >/dev/null
    fi
    #modprobe bonding

    if [ "$version" == "14" ];then
        test ! -f "${modules_file}" && touch "${modules_file}"
        local bonding_flag=`cat /etc/modules |grep "bonding"|egrep "mode=6" |wc -l`
        if [ "${bonding_flag}" -eq 0 ];
        then
            echo "bonding mode=6 miimon=100" >> "${modules_file}"
        fi
    else
        test ! -f "${modules_file}" && touch "${modules_file}"
        local bonding_flag=`cat /etc/modules |grep "bonding"|wc -l`
        if [ "${bonding_flag}" -eq 0 ];
        then
            echo "bonding" >> "${modules_file}"
        fi
    fi

    true > "${interfaces_file}"
    if [ "$version" == "14" ];then
        cat >> "${interfaces_file}" <<EOF
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto bond0
iface bond0 inet static
address $ip
netmask $netmask
EOF
        if [ "${default_gw}" != "" ];then
            echo "gateway ${default_gw}" >> "${interfaces_file}"
        else
            echo -e "gateway ${network}.1" >> ${interfaces_file}
        fi
        echo "" >> "${interfaces_file}"

        echo -e "\n=== all eths === "
        echo -e "[ $all_eths ]"
        echo -e "Make sure your input has space between every cards"
        read -p "input the eths that you want to bond: " eth
        bond_list="$eth"
        if [ $another_ips_num -ge 1 ];then
            echo -e "============= one more thing ==============="
            for i in `seq 1 $another_ips_num`
            do
                echo -e "----------"
                echo -e "auto bond0:${i}"
                echo -e "auto bond0:${i}" >> ${interfaces_file}
                echo -e "iface  bond0:${i} inet static" >> ${interfaces_file}
                echo -e "iface  bond0:${i} inet static"
                t_addr=$(cat ${t_f_bond} -n|column -t|egrep "^${i}"|awk '{print $2}')
                t_netmask=$(ifconfig |egrep -w $t_addr|awk -F'Mask:' '{print $2}'|column -t)
                echo -e "address $t_addr" >> ${interfaces_file}
                echo -e "address $t_addr"
                echo -e "netmask $t_netmask" >> ${interfaces_file}
                echo -e "netmask $t_netmask"
                echo -e ""
                echo -e "" >> ${interfaces_file}
                echo -e "---------"
            done
            for i in `seq 1 $lo_addrs_num`
            do
                echo -e "----------"
                echo -e "auto lo:${i}"
                echo -e "auto lo:${i}" >> ${interfaces_file}
                echo -e "iface  lo:${i} inet static" >> ${interfaces_file}
                echo -e "iface  lo:${i} inet static"
                t_addr=$(cat ${lo_f_bond} -n|column -t|egrep "^${i}"|awk '{print $2}')
                t_netmask=$(ifconfig -a|egrep -w $t_addr|awk -F'Mask:' '{print $2}'|column -t)
                echo -e "address $t_addr" >> ${interfaces_file}
                echo -e "address $t_addr"
                echo -e "netmask $t_netmask" >> ${interfaces_file}
                echo -e "netmask $t_netmask"
                echo -e ""
                echo -e "" >> ${interfaces_file}
                echo -e "---------"
            done
            echo -e "============================================"
        fi
        echo "" >> "${interfaces_file}"
        echo "" >> "${interfaces_file}"
        echo "dns-nameserver 114.114.114.114 233.5.5.5" >> "${interfaces_file}"
        echo "post-up ifenslave bond0 ${bond_list}" >> "${interfaces_file}"
        echo "pre-down ifenslave -d bond0 ${bond_list}" >> "${interfaces_file}"
    else
        echo -e "\n=== all eths === "
        echo -e "[ $all_eths ]"
        echo -e "Make sure your input has space between every cards"
        read -p "input the eths that you want to bond: " eth
        bond_list="$eth"
        for i in $bond_list
        do
            echo -e "auto $i"
            echo -e "iface $i inet manual"
            echo -e "bond-master bond0"
            echo -e ""
            echo -e "auto $i" >> ${interfaces_file}
            echo -e "iface $i inet manual" >> ${interfaces_file}
            echo -e "bond-master bond0" >> ${interfaces_file}
            echo -e "" >> ${interfaces_file}
        done
        cat >> "${interfaces_file}" <<EOF
auto lo
iface lo inet loopback

# The primary network interface
auto bond0
iface bond0 inet static
address $ip
netmask $netmask
EOF
        if [ "${default_gw}" != "" ];then
            echo "gateway ${default_gw}" >> "${interfaces_file}"
        else
            echo -e "gateway ${network}.1" >> ${interfaces_file}
        fi
        echo -e "bond-mode 6"
        echo -e "bond-miimon 100"
        echo -e "bond-lacp-rate 1"
        echo -e "bond-slaves $all_eths"
        echo -e "bond-mode 6" >> ${interfaces_file}
        echo -e "bond-miimon 100" >> ${interfaces_file}
        echo -e "bond-lacp-rate 1" >> ${interfaces_file}
        echo -e "bond-slaves $all_eths" >> ${interfaces_file}
        echo "dns-nameservers 114.114.114.114 233.5.5.5" >> "${interfaces_file}"
        echo "" >> "${interfaces_file}"
        echo "" >> "${interfaces_file}"
        if [ $another_ips_num -ge 1 ];then
            echo -e "============= one more thing ==============="
            for i in `seq 1 $another_ips_num`
            do
                echo -e "----------"
                echo -e "auto bond0:${i}"
                echo -e "auto bond0:${i}" >> ${interfaces_file}
                echo -e "iface  bond0:${i} inet static" >> ${interfaces_file}
                echo -e "iface  bond0:${i} inet static"
                t_addr=$(cat ${t_f_bond} -n|column -t|egrep "^${i}"|awk '{print $2}')
                t_netmask=$(ifconfig |egrep -w $t_addr|awk -F'Mask:' '{print $2}'|column -t)
                echo -e "address $t_addr" >> ${interfaces_file}
                echo -e "address $t_addr"
                echo -e "netmask $t_netmask" >> ${interfaces_file}
                echo -e "netmask $t_netmask"
                echo -e ""
                echo -e "" >> ${interfaces_file}
                echo -e "---------"
            done
            for i in `seq 1 $lo_addrs_num`
            do
                echo -e "----------"
                echo -e "auto lo:${i}"
                echo -e "auto lo:${i}" >> ${interfaces_file}
                echo -e "iface  lo:${i} inet static" >> ${interfaces_file}
                echo -e "iface  lo:${i} inet static"
                t_addr=$(cat ${lo_f_bond} -n|column -t|egrep "^${i}"|awk '{print $2}')
                t_netmask=$(ifconfig -a|egrep -w $t_addr|awk -F'Mask:' '{print $2}'|column -t)
                echo -e "address $t_addr" >> ${interfaces_file}
                echo -e "address $t_addr"
                echo -e "netmask $t_netmask" >> ${interfaces_file}
                echo -e "netmask $t_netmask"
                echo -e ""
                echo -e "" >> ${interfaces_file}
                echo -e "---------"
            done
            echo -e "============================================"
        fi
    fi
}

system_verison=`cat /etc/issue | grep -v '^$' | awk '{print $2}' | awk -F '.' '{print $1}'`
if [ $system_verison -eq 16 ];then
    version="16"
else
    version="14"
fi

########## Let's check if need do bond here if WE already did
interfaces_flag="$(ls /etc/network/ | grep "interfaces_backup_for_bond" | wc -l)"
interfaces_flag1="$(ls /etc/network/ | grep "interfaces_backup" | wc -l)"
if [ $interfaces_flag -ge 1 -o $interfaces_flag1 -ge 1 ];then
    echo -e "I found interfaces_backup_for_bond or interfaces_backup."
    echo -e "Maybe we have done bond on this machine.Please make sure if need do again."
    echo -e "If you still want to do. --> rename backup files [/etc/network/interfaces_backup_for_bond] <--  and run again"
    exit 21
fi
####################################################
interfaces_flag="$(ls /etc/network/ | grep "interfaces_backup_for_bond" | wc -l)"
backup_file "${interfaces_flag}" "${interfaces_file}"

net_rules_flag=`ls /etc/udev/rules.d/ | grep "70-persistent-net.rules_backup_for_bond" | wc -l`
backup_file "${net_rules_flag}" "${net_rules_file}"

generate_net_rules
generate_interfaces $version

echo "Bonding OK!"
echo ""
echo "Before restart the machine, please check the following file is configured correctly!"
echo -e "-----------------------------------------------------------------------------------"
echo "${interfaces_file}\n"
cat ${interfaces_file}
echo -e "-----------------------------------------------------------------------------------"
echo "${modules_file}\n"
cat ${modules_file}
echo -e "-----------------------------------------------------------------------------------"
echo "${net_rules_file}\n"
cat ${net_rules_file}
echo -e "-----------------------------------------------------------------------------------"
