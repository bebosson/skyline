#!/bin/bash

if [[ $EUID -ne 0 ]];
then
	echo "This script must be run as root"
	exit 1
fi
apt-get update
apt-get upgrade
apt-get install sudo
echo "Quel est votre nom d'utilisateur?"
read -r name
echo "name=$name"
adduser $name
echo 
while true; do
	read -p "ajout de l'utilisasateur au groupe sudo?" yn
	case $yn in
		[Yy]* ) adduser $name sudo; break;;
		[Nn]* ) echo "ok no sudo " 
			exit;;
		* ) echo "Please answer yes or no.";;
	esac
done




