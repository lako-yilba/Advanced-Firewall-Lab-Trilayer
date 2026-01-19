# Default Firewall Policy

## Scope of Default Policies

Default policies apply exclusively to the **filter** table.
The **nat**, **mangle**, and **raw** tables do not support
default policies, as they do not make final accept or drop
decisions.

All packet filtering decisions are ultimately enforced
by the filter table after traversal through other tables.

---

## Purpose

Establish a secure baseline by defining how the firewall
handles traffic that does not match any explicit rule.

---

## Policies Applied

- **INPUT**: DROP  
- **FORWARD**: DROP  
- **OUTPUT**: ACCEPT  

---

## Security Rationale

A default deny policy ensures that:

- Only explicitly permitted traffic is allowed
- Accidental service exposure is prevented
- The system attack surface is minimized

---

## Why OUTPUT Is Allowed

Outbound traffic is permitted to ensure:

- Package updates function correctly
- DNS and HTTP/HTTPS requests operate normally
- System usability and connectivity are preserved

---

## Execution Order

This script is executed immediately after a firewall reset
and before allowing specific services or protocols.
