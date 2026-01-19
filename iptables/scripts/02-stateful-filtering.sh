#!/bin/bash
# Stateful firewall baseline rules

# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
  echo "Run as root"
  exit 1
fi

# -------------------------
# Allow loopback traffic
# -------------------------
iptables -A INPUT  -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# -----------------------------------
# Allow established/related traffic
# -----------------------------------
iptables -A INPUT  -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
