#!/bin/bash

if [[ $EUID -ne 0 ]]; 
then
	echo "This script must be run as root" 
	exit 1
fi
echo "quel port souhaitez vous configurez pour le service ssh?"
read -r port
sed -i -e "s/#port 22/port $port/g"  /etc/ssh/sshd_config
cat /etc/ssh/ssh_config




