#!/bin/bash

SCRIPT_PATH="$(cd "$(dirname "$0")"; pwd)"
cd $SCRIPT_PATH

allow_ssh_port="10022"
iptables_bin=$(which iptables)

$iptables_bin -S INPUT |egrep "$allow_ssh_port" |awk -F'INPUT' '{print $2}' > /tmp/rule_to_delete_10022
while read rule
do
    $iptables_bin -D INPUT $rule
done < /tmp/rule_to_delete_10022
rm /tmp/rule_to_delete_10022
