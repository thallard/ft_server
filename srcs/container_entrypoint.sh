# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    container_entrypoint.sh                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thallard <thallard@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/11 11:35:27 by thallard          #+#    #+#              #
#    Updated: 2020/12/14 17:05:30 by thallard         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# SQL
service mysql start
sudo mysql < wordpress.sql

# SSL
wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.0/mkcert-v1.4.0-linux-amd64
chmod +x mkcert-v1.4.0-linux-amd64
sudo mv ./mkcert-v1.4.0-linux-amd64 /usr/local/bin/mkcert
mkcert -install
mkcert localhost 127.0.0.1

# Nginx
rm -rf /etc/nginx/sites-enabled/default
cp nginx.conf /etc/nginx/sites-enabled/

# Wordpress
tar xvfz latest.tar.gz
mv wordpress/* /var/www/html/
rm /var/www/html/wp-config-sample.php
cp wp-config.php /var/www/html


# PHPMyAdmin
tar xvfz phpmyadmin.tar.gz
mv phpMyAdmin-4.9.7-all-languages phpmyadmin
mv phpmyadmin /var/www/html/

service php7.3-fpm start
service nginx start

tail -f /var/log/nginx/access.log /var/log/nginx/error.log
