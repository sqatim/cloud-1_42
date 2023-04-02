

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
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.tar.gz &&\
tar zxvf phpMyAdmin-5.2.1-all-languages.tar.gz &&\
rm phpMyAdmin-5.2.1-all-languages.tar.gz

# cp -r phpMyAdmin-5.0.2-all-languages/* /www/phpmyadmin
# rm phpmyadmin/config.sample.inc.php && \
# mv /config.inc.php /www/phpmyadmin/
COPY    ./tools/config.inc.php /phpMyAdmin-5.2.1-all-languages
# COPY    ./tools/config.inc.php /usr/share/webapps/phpmyadmin
RUN     chmod 644 /phpMyAdmin-5.2.1-all-languages/config.inc.php
# RUN     ln -s /usr/share/webapps/phpmyadmin/ /www/phpmyadmin

COPY    tools/*.sh /
RUN     chmod +x /*.sh

ENTRYPOINT ["/bin/sh", "run.sh"]