#!/bin/bash
# Service Whitelisting Rules
# Allows only explicitly required services

# Allow SSH only from a trusted management IP
iptables -A INPUT -p tcp --dport 22 -s 192.168.1.10 -m conntrack --ctstate NEW -j ACCEPT

# Allow HTTP traffic
iptables -A INPUT -p tcp --dport 80 -m conntrack --ctstate NEW -j ACCEPT

# Allow HTTPS traffic
iptables -A INPUT -p tcp --dport 443 -m conntrack --ctstate NEW -j ACCEPT
