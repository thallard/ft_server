#!/bin/bash

if [ $1 = "true" ]; then
	sudo rm /etc/nginx/sites-enabled/nginx.conf
	cp nginx_auto.conf /etc/nginx/sites-enabled/
fi
if [ $1 = "false" ]; then
	sudo rm /etc/nginx/sites-enabled/nginx_auto.conf
	cp nginx.conf /etc/nginx/sites-enabled/
fi

service nginx restart
