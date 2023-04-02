#!/bin/sh

# Database Creating
if ! ls /var/lib/mysql/* ; then
	openrc 2> /dev/null  ; touch /run/openrc/softlevel; \
    /etc/init.d/mariadb setup 2> /dev/null ; \
    /etc/init.d/mariadb start 2> /dev/null ; \
    mysql -u root -e "CREATE DATABASE $DATABASE_NAME;";\
    mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';";\
    mysql -u root -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DB_USER'@'%';";\
    mysql -u root -e "FLUSH PRIVILEGES;";
	sed -i "s|https://localhost|https://${DOMAIN_NAME}|g" /$DATABASE_NAME.sql
	cd /var/lib/mysql ; mysql -u root $DATABASE_NAME < /$DATABASE_NAME.sql; rm /$DATABASE_NAME.sql
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"; \
	/etc/init.d/mariadb stop 2> /dev/null ;

	sed -i 's/#bind-address=0.0.0.0/bind-address=0.0.0.0/' /etc/my.cnf.d/mariadb-server.cnf
	sed -i 's/skip-networking/#skip-networking/' /etc/my.cnf.d/mariadb-server.cnf
	/etc/init.d/mariadb start 2> /dev/null
	/etc/init.d/mariadb stop 2> /dev/null
fi

# Run MariaDB in foreground mode by daemon
cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'

# mysqldump --add-drop-table -u root -p $DATABASE_NAME > $DATABASE_NAME.sql