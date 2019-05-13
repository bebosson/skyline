#!/bin/bash

if [[ $EUID -ne 0 ]];
then
	echo "This script must be run as root"
	exit 1
fi
apt-get update
apt-get upgrade
apt-get install apache2
rm -r /var/www/html/
cp -r html /var/www/
echo "\n## SSL PART ##\n"
mkdir /home/toto/ssl_files
cd /home/toto/ssl_files
openssl genrsa -des3 -out server.key 1024
openssl req -new -key server.key -out server.csr

cp server.key server.key.org
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

echo '<VirtualHost *:80>
ServerName debian
DocumentRoot "/var/www/html"
<directory /var/www/html>
Options -Indexes +FollowSymLinks +MultiViews
AllowOverride All
Require all granted
</Directory>
</VirtualHost>
<virtualhost *:443>
ServerName debian
DocumentRoot "/var/www/html"
# Activation du mode SSL
SSLEngine On
SSLOptions +FakeBasicAuth +ExportCertData +StrictRequire
SSLCertificateFile "/home/toto/ssl_files/server.crt"
SSLCertificateKeyFile "/home/toto/ssl_files/server.key"
<directory /var/www/html>
Options -Indexes +FollowSymLinks +MultiViews
AllowOverride All
Require all granted
</Directory>
</virtualhost>' > /etc/apache2/sites-enabled/000-default.conf
sudo a2enmod ssl
service apache2 restart

