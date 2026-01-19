#!/bin/bash
# Rate limiting to protect services from brute-force and DoS attacks

# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
  echo "Run as root"
  exit 1
fi

# ---------------------------------------
# Rate limit SSH connections (TCP 22)
# ---------------------------------------

# Allow up to 3 new SSH connections per minute per IP
iptables -A INPUT -p tcp --dport 22 \
  -m conntrack --ctstate NEW \
  -m limit --limit 3/minute --limit-burst 3 \
  -j ACCEPT

# Drop excess SSH connection attempts
iptables -A INPUT -p tcp --dport 22 \
  -m conntrack --ctstate NEW \
  -j DROP
