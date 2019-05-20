# !/bin/bash
echo "setting up apache2 server"

systemctl enable apache2
apache2ctl configtest
systemctl restart apache2
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt
mv ssl/ssl-params.conf /etc/apache2/conf-available/ssl-params.conf
cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.bak
mv ssl/000-default.conf /etc/apache2/sites-available/000-default.conf
#mv files /var/www/html
#mv files/style.css /var/www/html
#mv files /var/www/html
a2enmod ssl
a2enmod headers
a2ensite default-ssl
a2enconf ssl-params
apache2ctl configtest
systemctl restart apache2
