#!/bin/sh
set -e

nginx -g 'daemon off;' &

php-fpm