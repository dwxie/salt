#!/bin/bash

iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8001 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8002 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8003 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8004 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8005 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8006 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8007 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8008 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8009 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8010 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8011 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8012 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8101 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8102 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8103 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8104 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8105 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8106 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8107 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8108 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8109 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8110 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8111 -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8112 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 8001 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8002 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8003 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8004 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8005 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8006 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8007 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8008 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8009 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8010 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8011 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8012 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8101 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8102 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8103 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8104 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8105 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8106 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8107 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8108 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8109 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8110 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8111 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 8112 -j DROP

iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8001 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8002 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8003 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8004 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8005 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8006 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8007 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8008 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8009 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8010 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8011 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8012 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8101 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8102 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8103 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8104 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8105 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8106 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8107 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8108 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8109 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8110 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8111 -j ACCEPT
iptables -D INPUT -s 127.0.0.1/32 -p tcp -m tcp --dport 8112 -j ACCEPT
iptables -D INPUT -p tcp -m tcp --dport 8001 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8002 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8003 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8004 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8005 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8006 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8007 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8008 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8009 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8010 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8011 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8012 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8101 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8102 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8103 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8104 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8105 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8106 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8107 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8108 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8109 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8110 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8111 -j DROP
iptables -D INPUT -p tcp -m tcp --dport 8112 -j DROP
