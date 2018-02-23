#!/bin/bash

iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8001 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8002 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8003 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8004 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8005 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8006 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8101 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8102 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8103 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8104 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8105 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8106 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 8001 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8002 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8003 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8004 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8005 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8006 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8101 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8102 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8103 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8104 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8105 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8106 -j DROP

iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8001 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8002 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8003 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8004 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8005 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8006 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8101 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8102 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8103 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8104 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8105 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8106 -j ACCEPT
iptables -D INPUT -p tcp -m tcp --dport 8001 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8002 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8003 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8004 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8005 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8006 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8101 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8102 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8103 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8104 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8105 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8106 -j DROP
