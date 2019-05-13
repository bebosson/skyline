if [[ $EUID -ne 0 ]];
then
	echo "This script must be run as root"
	exit 1
fi
apt-get update
apt-get install fail2ban
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local


