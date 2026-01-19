# Stateful Filtering

## Purpose
Implements baseline firewall behavior required for a
stateful firewall. This includes allowing loopback
traffic and permitting packets that belong to
established or related connections.

## Components

### Loopback Traffic
Loopback traffic (`lo`) allows local processes to
communicate with each other. Blocking loopback traffic
can break system services and applications.

### Established and Related Connections
Stateful filtering uses connection tracking to allow
response traffic for outbound connections while still
blocking unsolicited inbound traffic.

Connection states used:
- ESTABLISHED
- RELATED

## Why This Is Required
Without stateful filtering:
- Outbound connections cannot receive replies
- SSH and web traffic break
- System services become unstable

## Security Impact
- Maintains a default deny policy
- Allows only legitimate response traffic
- Does not expose new inbound services

## Execution Order
This script must run after setting default firewall
policies and before allowing any external services.
