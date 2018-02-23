#!/bin/bash

iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 7001 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 7002 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 7003 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 7004 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 7001 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 7002 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 7003 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 7004 -j DROP

iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 7001 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 7002 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 7003 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 7004 -j ACCEPT
iptables -D INPUT -p tcp -m tcp --dport 7001 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 7002 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 7003 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 7004 -j DROP
