

FROM    alpine:3.12
LABEL   Author "asaadi <asaadi@student.1337.ma>"

RUN     apk update
# RUN     apk add nginx
RUN     apk add openrc

# RUN     mkdir /www
# RUN     chown -R nginx:nginx /var/lib/nginx
# RUN     chown -R nginx:nginx /www
# RUN     rm /etc/nginx/nginx.conf
# COPY    srcs/nginx.conf /etc/nginx/
# RUN     mkdir /run/nginx

RUN     apk add php7-fpm
RUN     apk add phpmyadmin 2> /dev/null || true
RUN     chmod -R 777 /usr/share/webapps/
RUN     mkdir -p /www/phpmyadmin
COPY    ./tools/config.inc.php /usr/share/webapps/phpmyadmin
RUN     chmod 644 /usr/share/webapps/phpmyadmin/config.inc.php
# RUN     ln -s /usr/share/webapps/phpmyadmin/ /www/phpmyadmin

COPY    tools/*.sh /
RUN     chmod +x /*.sh

EXPOSE  5000

ENTRYPOINT ["/bin/sh", "/run.sh"]