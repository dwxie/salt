#!/bin/bash

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

interfaces_file="/etc/network/interfaces"
net_rules_file="/etc/udev/rules.d/70-persistent-net.rules"
macs="$(/sbin/ifconfig -a | grep "HWaddr" | grep -v "bond" | sed 's/.*HWaddr //g')"

backup_file() {
    flag="${1}"
    file="${2}"
    if [ "${flag}" -eq 0 ];
    then
        test -f "${file}" && cp "${file}" "${file}_backup"
    fi
}

generate_net_rules() {
    local num=0
    true > "${net_rules_file}"
    for mac in ${macs}
    do
        echo "SUBSYSTEM==\"net\", ACTION==\"add\", ATTR{address}==\"${mac}\", NAME=\"eth${num}\"" >> "${net_rules_file}"
        num=`expr $num + 1`
    done
}

generate_interfaces() {
    local ips="$(cat "${interfaces_file}_backup" | grep -w "^address" |awk '{print $2}')"
    local ip_count="$(cat "${interfaces_file}_backup" | grep -w "^address" | awk '{print $2}' | wc -l)"
    if [ "${ip_count}" -gt 0 ]
    then
        true > "${interfaces_file}"
        cat >> "${interfaces_file}" <<EOF
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
EOF
        nic_seq=0
        for ip in $ips
        do
            nic="$(cat "${interfaces_file}_backup" | grep "${ip}" -B 2 | grep -v "bond" | grep -w "iface" | awk '{print $2}')"
            netmask="$(cat "${interfaces_file}_backup" | grep "${ip}" -A 3 | grep -w "netmask" | awk '{print $2}')"
            gateway="$(cat "${interfaces_file}_backup" | grep "${ip}" -A 3 | grep -w "gateway" | awk '{print $2}')"
            cat >> "${interfaces_file}" <<EOF
auto eth${nic_seq}
iface eth${nic_seq} inet static
address ${ip}
netmask ${netmask}
EOF
            if [ ! -z "${gateway}" ];
            then
                echo "gateway ${gateway}" >> "${interfaces_file}"
            fi
            echo "" >> "${interfaces_file}"
            nic_seq=`expr ${nic_seq} + 1`
        done
    else
        echo "ip not exist!!!"
    fi
    echo "dns-nameserver 114.114.114.114 233.5.5.5" >> "${interfaces_file}"
}

interfaces_flag="$(ls /etc/network/ | grep "interfaces_backup" | wc -l)"
backup_file "${interfaces_flag}" "${interfaces_file}"

net_rules_flag=`ls /etc/udev/rules.d/ | grep "70-persistent-net.rules_backup" | wc -l`
backup_file "${net_rules_flag}" "${net_rules_file}"

generate_net_rules
generate_interfaces

echo "Mac Binding OK!"
echo ""
echo "Before restart the machine, please check the following file is configured correctly!"
echo "${interfaces_file}"
echo "${net_rules_file}"
