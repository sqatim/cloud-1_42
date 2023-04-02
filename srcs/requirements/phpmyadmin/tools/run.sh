# !/bin/sh

sed -i 's/127.0.0.1/0.0.0.0/' /etc/php7/php-fpm.d/www.conf
# ln -s /usr/share/webapps/phpmyadmin/ /www/phpmyadmin
# cp /usr/share/webapps/phpmyadmin/* /www/phpmyadmin/
cp -r phpMyAdmin-5.2.1-all-languages/* /www/phpmyadmin
chmod -R 777 /www/phpmyadmin
rm -rf /www/phpmyadmin/config.sample.inc.php

chmod 644 /www/phpmyadmin/config.inc.php

# run php-fpm7 in forgeound (-F) and allow root (-R)
/usr/sbin/php-fpm7 -FR
