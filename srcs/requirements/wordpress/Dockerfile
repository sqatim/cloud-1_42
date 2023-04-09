FROM    alpine:3.14.2
LABEL   Author "asaadi <asaadi@student.1337.ma>"

RUN     apk update

RUN    	apk add php7 php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl \ 
		php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
		php7-mbstring php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype \
		php7-dom php7-opcache php7-zlib php7-session php7-intl php7-zip

RUN     wget http://wordpress.org/latest.tar.gz; \
        tar -xzvf latest.tar.gz ; rm latest.tar.gz;

RUN		rm /wordpress/wp-config-sample.php
COPY	./conf/wp-config.php /wordpress

COPY    ./tools/run.sh /
RUN     chmod +x /run.sh

ENTRYPOINT ["/bin/sh", "run.sh"]
