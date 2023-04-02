# !/bin/sh

sed -i 's/127.0.0.1/0.0.0.0/' /etc/php7/php-fpm.d/www.conf
ln -s /usr/share/webapps/phpmyadmin/ /www/phpmyadmin
# run php-fpm7 in forgeound (-F) and allow root (-R)
/usr/sbin/php-fpm7 -FR
