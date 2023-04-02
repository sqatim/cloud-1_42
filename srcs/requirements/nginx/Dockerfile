# Base Image
FROM    alpine:3.14.2
LABEL   Author "asaadi <asaadi@student.1337.ma>"

#Installation
    # Updating APK Packages
    RUN     apk update

    # Installing Nginx Package
    RUN     apk add nginx

    # Creating directory for html files
    RUN     mkdir /www
    RUN     chown -R nginx:nginx /var/lib/nginx
    RUN     chown -R nginx:nginx /www

#  Configuration
    RUN     rm /etc/nginx/nginx.conf
    COPY    ./conf/nginx.conf /etc/nginx/

# Configuration ssl
    RUN     apk add openssl

    RUN     printf 'MA\nKHOURIBGA\nKHOURIBGA\n1337FIL\n1337Ltd\nAnouar SAADI\nasaadi@student.1337.ma\n' | \
            openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
            -out /etc/ssl/certs/nginx-selfsigned.crt 2> /dev/null || true
    
    # Script that will execute in container at runtime.
	COPY	./tools/run.sh /
	RUN		chmod +x /run.sh

# Exposing the port
	EXPOSE  443

ENTRYPOINT ["/bin/sh", "run.sh"]
