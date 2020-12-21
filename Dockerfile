FROM debian:buster

RUN apt-get -y update && apt-get -y install mariadb-server \
	 wget \
	 php7.3 \
	 php-cli \
	 php-cgi \
	 php-mbstring \
	 php-fpm \
	 php-mysql \ 
	 php-json \
	 sudo \
	 nginx \
	 libnss3-tools 

COPY srcs .

EXPOSE 80
EXPOSE 443

WORKDIR .

ENTRYPOINT ["bash", "container_entrypoint.sh"]
