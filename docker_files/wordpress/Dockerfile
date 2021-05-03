
FROM alpine:latest

ARG WWW_PATH

# update && install nginx
RUN apk update && apk add --no-cache nginx gettext php7-fpm php7-mysqli php7-pdo_mysql php7-json

RUN adduser -D -g 'www' www \
		&& mkdir ${WWW_PATH} && chown -R www:www /var/lib/nginx \
		&& chown -R www:www ${WWW_PATH}

RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY nginx.conf /etc/nginx/nginx.conf.tmp

RUN envsubst '${WWW_PATH}' < /etc/nginx/nginx.conf.tmp > /etc/nginx/nginx.conf

RUN rm /etc/nginx/nginx.conf.tmp

RUN mkdir -p /run/nginx/logs
RUN touch /run/nginx/logs/error.log

RUN wget https://wordpress.org/latest.tar.gz -O wordpress.tar.gz

RUN tar -xvf wordpress.tar.gz -C /www --strip-components=1

RUN rm wordpress.tar.gz
COPY entrypoint.sh /tmp

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["./tmp/entrypoint.sh"]

EXPOSE 80

#CMD ["nginx", "-p", "/run/nginx", "-g", "daemon off;"]
