#!/bin/bash

# usage : change the protocol to the static ip address
if [[ $EUID -ne 0 ]]; 
then
	echo "This script must be run as root" 
	exit 1
fi
echo "a quel etage etes vous ?"
read -r etage
if [ "$etage" != 1 ] && [ "$etage" != 2 ] && [ "$etage" != 3 ]; 
then
	echo "$etage n'est pas correct"
else
	sed -i -e "s/dhcp/static/g" /etc/network/interfaces
echo "# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
allow-hotplug enp0s3
iface enp0s3 inet static
address 10.1$etage.73.73
gateway 10.1$etage.254.254
netmask 255.255.255.252" > /etc/network/interfaces
cat /etc/network/interfaces
fi
