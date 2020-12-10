#!/bin/bash

service nginx start
mkdir /var/www/localhost


cp ./index.html /var/www/html/

# PHPMyAdmin part
@wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages /usr/share/phpMyAdmin

ls -la /etc/nginx/sites-available

ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

cp info.php /var/www/html/info.php

service mysql start

/etc/init.d/php7.3-fpm start
/etc/init.d/php7.3-fpm status

# SSL part
apt-get install openssl

tail -f /var/log/nginx/access.log /var/log/nginx/error.log 
