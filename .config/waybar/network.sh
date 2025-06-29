#!/bin/bash
# Get the default interface (the one with internet access)
INTERFACE=$(ip route | grep default | awk '{print $5}' | head -n1)

# Check if we have any interface at all
if [ -z "$INTERFACE" ]; then
    echo "󰈂 Disconnected"
    exit 0
fi

# Check if the interface is actually up and has an IP
IP=$(ip addr show $INTERFACE 2>/dev/null | grep -o 'inet [0-9.]*' | cut -d' ' -f2)

if [ -z "$IP" ]; then
    echo "󰈂 Disconnected"
    exit 0
fi

# Check interface type and show appropriate icon/text
if [[ $INTERFACE == *"pvpn"* ]]; then
    echo "🔒VPN"
elif [[ $INTERFACE == "eth"* ]] || [[ $INTERFACE == "enp"* ]]; then
    echo "󰈀 Ethernet"
elif [[ $INTERFACE == "wlan"* ]] || [[ $INTERFACE == "wlp"* ]]; then
    echo "󰖩 WiFi"
else
    echo "󰈀 $INTERFACE"
fi
