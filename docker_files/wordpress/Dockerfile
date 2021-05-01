FROM alpine:latest

ARG WWW_PATH

# update && install nginx
RUN apk update && apk add --no-cache nginx gettext

RUN adduser -D -g 'www' www \
		&& mkdir ${WWW_PATH} && chown -R www:www /var/lib/nginx \
		&& chown -R www:www ${WWW_PATH}

RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY nginx.conf /etc/nginx/nginx.conf.tmp

RUN echo "${WWW_PATH}"
RUN envsubst < /etc/nginx/nginx.conf.tmp > /etc/nginx/nginx.conf

RUN rm /etc/nginx/nginx.conf.tmp

RUN mkdir -p /run/nginx/logs
RUN touch /run/nginx/logs/error.log

EXPOSE 80

CMD ["nginx", "-p", "/run/nginx", "-g", "daemon off;"]
