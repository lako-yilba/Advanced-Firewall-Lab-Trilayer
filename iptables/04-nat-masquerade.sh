#!/bin/bash
# Enable NAT masquerading for outbound traffic

# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
  echo "Run as root"
  exit 1
fi

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Masquerade outbound traffic
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
