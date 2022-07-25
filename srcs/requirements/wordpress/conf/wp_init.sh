#! /bin/bash

if [ -f /var/www/html/.installed ]
then
	echo "CACA"
else
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
	chmod +x /usr/local/bin/wp
	mkdir -p /var/www/html
	chmod 755 /var/www/html
	wp core download --path=/var/www/html --allow-root
	wp config create --path=/var/www/html --allow-root --dbname=$MYSQL_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PW --dbhost=$MYSQL_HOST
	wp core install --path=/var/www/html --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_email=$WP_ADMIN_EMAIL --admin_password=$WP_ADMIN_PW
	wp user create $WP_USER $WP_USER_EMAIL --role='author' --user_pass=$WP_USER_PW --path=/var/www/html --allow-root
	touch /var/www/html/.installed
fi

exec "$@"
