FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add vsftpd openssl supervisor\
	 telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN echo "root:qwerty" | chpasswd

RUN openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=melisha/CN=localhost" \
		-keyout /etc/ssl/private/vsftpd.key \
		-out /etc/ssl/certs/vsftpd.crt

COPY ./srcs/supervisor.conf /etc/supervisord.conf
COPY ./srcs/telegraf.conf /etc/telegraf/
COPY ./srcs/vsftpd.conf /etc/vsftpd/
COPY ./srcs/start.sh .

EXPOSE	21 30021
RUN chmod +x start.sh
CMD sh start.sh