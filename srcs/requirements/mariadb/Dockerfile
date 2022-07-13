FROM debian:buster

RUN apt update -y && apt install -y mariadb-server mariadb-client \
&& rm -rf /var/lib/apt/lists/* \
&& mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY ./conf/db_init.sh /usr/local/bin/

ENTRYPOINT ["db_init.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]
