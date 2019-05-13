#!/bin/bash

if [[ $EUID -ne 0 ]]; 
then
	echo "This script must be run as root" 
	exit 1
fi
echo "quel port souhaitez vous configurez pour le service ssh?"
read -r port
if [ "$port" = 80 ] || [ "$port" = 443 ] || [ "$port" = 53 ];
then
		echo "$port deja utilise"
		exit
fi
sed -i -e "s/dhcp/static/g" /etc/network/interfaces
sed -i -e s/"#Port 22"/"port $port"/g  /etc/ssh/sshd_config
cat /etc/ssh/sshd_config
echo "le service sshd va redemarrer"
service sshd restart
echo "statut du service sshd ==>"
systemctl status sshd



