#!/bin/bash

if [[ $EUID -ne 0 ]];
then
		echo "This script must be run as root"
		exit 1
fi


#On recupere le port ssh
port=$(cat /etc/ssh/sshd_config | grep port | awk -F " "  '{print $2}')
echo $port

# Réinitialise les règles
iptables -t filter -F 
iptables -t filter -X 
 
# Bloque tout le trafic
iptables -t filter -P INPUT DROP 
iptables -t filter -P FORWARD DROP 
iptables -t filter -P OUTPUT DROP 
 
# Autorise les connexions déjà établies et localhost
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT 
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT 
iptables -t filter -A INPUT -i lo -j ACCEPT 
iptables -t filter -A OUTPUT -o lo -j ACCEPT 
 
# ICMP (Ping)
iptables -t filter -A INPUT -p icmp -j ACCEPT 
iptables -t filter -A OUTPUT -p icmp -j ACCEPT 
 
# SSH
iptables -t filter -A INPUT -p tcp --dport $port -j ACCEPT 
iptables -t filter -A OUTPUT -p tcp --dport $port -j ACCEPT 
 
# DNS
#sudo iptables -t filter -A OUTPUT -p tcp --dport 53 -j ACCEPT 
#sudo iptables -t filter -A OUTPUT -p udp --dport 53 -j ACCEPT 
#sudo iptables -t filter -A INPUT -p tcp --dport 53 -j ACCEPT 
#sudo iptables -t filter -A INPUT -p udp --dport 53 -j ACCEPT 
 
# HTTP
iptables -t filter -A OUTPUT -p tcp --dport 80 -j ACCEPT 
iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT 

#Flood ou déni de servic
iptables -A FORWARD -p tcp --syn -m limit --limit 1/second -j ACCEPT
#protocol Udp et IMCP
iptables -A FORWARD -p udp -m limit --limit 1/second -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 1/second -j ACCEPT
#Scan de ports 
iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT
# FTP 
#sudo iptables -t filter -A OUTPUT -p tcp --dport 20:21 -j ACCEPT 
#sudo iptables -t filter -A INPUT -p tcp --dport 20:21 -j ACCEPT 

# Mail SMTP 
#iptables -t filter -A INPUT -p tcp --dport 25 -j ACCEPT 
#iptables -t filter -A OUTPUT -p tcp --dport 25 -j ACCEPT 
 
# Mail POP3
#iptables -t filter -A INPUT -p tcp --dport 110 -j ACCEPT 
#iptables -t filter -A OUTPUT -p tcp --dport 110 -j ACCEPT 
 
# Mail IMAP
#iptables -t filter -A INPUT -p tcp --dport 143 -j ACCEPT 
#iptables -t filter -A OUTPUT -p tcp --dport 143 -j ACCEPT 

# NTP (horloge du serveur) 
#sudo iptables -t filter -A OUTPUT -p udp --dport 123 -j ACCEPT
