FROM debian:buster

RUN apt update && apt install -y \
wget \
php \
php-mysql \
php-fpm \
php-cgi \
mariadb-client

RUN mkdir /run/php

RUN sed -i 's/listen = \/run\/php\/php7\.3-fpm\.sock/listen = 0\.0\.0\.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

COPY ./conf/wp_init.sh /usr/local/bin/wp_init.sh
ENTRYPOINT ["wp_init.sh"]

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
