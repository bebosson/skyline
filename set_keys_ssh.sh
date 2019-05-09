#!/bin/bash

if [[ $EUID -ne 0 ]]; 
then
	echo "This script must be run as root" 
	exit 1
fi
login="$(whoami)"
ip="$(cat /etc/network/interfaces | grep "address"| awk -F ' ' '{print $2}')"
echo "ip = $ip"
echo "login = $login"
#echo "Nous allons creer les publickeys necessaire pour l'acces ssh"
#echo "Creation du dossier ~/.ssh  et des cles d'autoristaion"
#mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys
#chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys
#ssh-keygen -b 4096 -t rsa
#ssh-copy-id -i id_rsa.pub login@ip -p
