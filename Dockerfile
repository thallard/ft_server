FROM debian:buster

RUN apt-get -y update && apt-get -y install mariadb-server \
	 wget \
	 php \
	 php-cli \
	 php-cgi \
	 php-mbstring \
	 php-fpm \
	 php-mysql \ 
	 nginx \ 
	 libnss3-tools

COPY srcs .

EXPOSE 8080

WORKDIR .

ENTRYPOINT ["bash", "container_entrypoint.sh"]
