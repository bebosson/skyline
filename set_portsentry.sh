#!/bin/bash
if [[ $EUID -ne 0 ]];
then
		echo "This script must be run as root"
			exit 1
fi
#on installe le service
apt-get update && apt-get install portsentry
#on arrete le service 
/etc/init.d/portsentry stop
echo "TCP_MODE="atcp"
UDP_MODE="audp"" >> /etc/default/portsentry
sed -i ' s/TCP_MODE="tcp"/BLOCK_TCP="atcp"/' /etc/default/portsentry
sed -i ' s/UDP_MODE="udp"/UDP_MODE="audp"/' /etc/default/portsentry
sed -i ' s/BLOCK_TCP="0"/BLOCK_TCP="1"/' /etc/portsentry/portsentry.conf
sed -i ' s/BLOCK_UDP="0"/BLOCK_UDP="1"/' /etc/portsentry/portsentry.conf
sed -i ' s/KILL/#KILL/' /etc/portsentry/portsentry.conf
#sed -i ' s/#KILL_ROUTE="/sbin/iptables -I INPUT -s $TARGET$ -j DROP"/KILL_ROUTE="/sbin/iptables -I INPUT -s $TARGET$ -j DROP"/'
#sed -i '2 s/^/#/' note
sed -i '209 s/#//'  /etc/portsentry/portsentry.conf
#on redemarre le service
/etc/init.d/portsentry start
