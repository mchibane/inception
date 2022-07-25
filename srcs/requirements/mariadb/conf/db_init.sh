#! /bin/bash

service mysql start

if [ -d /var/lib/mysql/$MYSQL_DB_NAME ]
then
	echo "Database already exists"
else


echo "before heredoc"

mysql -uroot --skip-password <<__EOF__
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PW';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;
GRANT ALL ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PW';
FLUSH PRIVILEGES;
__EOF__

echo "after heredoc"

sed -i "s/password = /password = $MYSQL_ROOT_PW/g" /etc/mysql/debian.cnf

fi

service mysql stop
exec "$@"
