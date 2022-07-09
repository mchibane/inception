FROM debian:buster

RUN apt-get update -y && apt-get install -y nginx openssl 

RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=France/L=Paris/O=42/OU=./CN=mchibane.42.fr/emailAddress=mchibane@student.42.fr"\
	-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
