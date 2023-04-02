#!/bin/sh
#  creating in born run
if ! ls /www/wordpress/* ; then
	sed -i 's/127.0.0.1/0.0.0.0/' /etc/php7/php-fpm.d/www.conf
	mkdir /www 2> /dev/null || true ; mkdir /www/wordpress 2> /dev/null || true
	tar -zxvf /wordpress/wp-content/plugins/redis-cache.tar.gz
	rm -rf /wordpress/wp-content/plugins/redis-cache.tar.gz
	mv /wordpress/* /www/wordpress/
	rm -rf /wordpress
	sed -i "s/database_name/$DATABASE_NAME/" /www/wordpress/wp-config.php
	sed -i "s/db_user/$DB_USER/" /www/wordpress/wp-config.php
	sed -i "s/db_pass/$DB_PASSWORD/" /www/wordpress/wp-config.php
	sed -i "s/db_host/$DB_HOST/" /www/wordpress/wp-config.php
	sed -i "s/domaine_name/$DOMAIN_NAME/" /www/wordpress/wp-config.php
fi

# run php-fpm7 in forgeound (-F) and allow root (-R)
/usr/sbin/php-fpm7 -FR
