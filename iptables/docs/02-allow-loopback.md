# Allow Loopback Traffic

## Purpose
Allows traffic on the loopback interface (`lo`) so that
local processes can communicate with each other.

## Why Loopback Is Critical
Many system services rely on localhost communication,
including:
- DNS resolvers
- Package managers
- Database services
- Desktop and system daemons

Blocking loopback traffic can cause system instability
or complete service failure.

## Rules Applied
- Accept all inbound traffic on `lo`
- Accept all outbound traffic on `lo`

## Security Considerations
Loopback traffic never leaves the host, so allowing it
does not expose the system to external network attacks.

## Execution Order
This script must run immediately after setting default
policies and before allowing any external services.
