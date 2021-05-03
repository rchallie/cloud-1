#!/bin/sh

php-fpm7 -D;
nginx -p /run/nginx -g 'daemon off;';
