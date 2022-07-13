#! /bin/bash

mysql_install_db

service mysql start

if [ -d /var/run/mysql/${MYSQL_DB_NAME} ]; then
	echo "Database already exists"
else
	mysql -uroot -p << __EOF__
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PW';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';
CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;
GRANT ALL ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PW';
FLUSH PRIVILEGES;
__EOF__
fi

service mysql stop

exec "$@"
