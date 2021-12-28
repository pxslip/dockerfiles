FROM php:7.4-fpm-bullseye

ARG workspaceFolder=/var/www

# install dependencies for gd, pdo_mysql, exif, zip, mcrypt, xdebug
RUN DEBIAN_FRONTEND=noninteractive apt-get update\
  && apt-get install -y\
  libmcrypt-dev\
  libpng-dev\
  libjpeg62-turbo-dev\
  libfreetype6-dev\
  libzip-dev\
  mariadb-client\
  cron\
  git\
  nginx\
  && docker-php-ext-configure gd --with-freetype --with-jpeg\
  && docker-php-ext-install pdo_mysql gd exif zip\
  && pecl install mcrypt\
  && pecl install xdebug\
  && docker-php-ext-enable mcrypt\
  && docker-php-ext-enable xdebug

# Install node/npm
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -\
  && apt-get install -y nodejs

# Install composer v2.1.12
RUN curl -fsSL https://raw.githubusercontent.com/composer/getcomposer.org/7eb36fbca44eafe780f225b3b005697b43feb3c0/web/installer | php\
  && mv composer.phar /usr/local/bin/composer

COPY ./laravel-tasks.cron /etc/cron.d
COPY ./xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
COPY ./nginx.conf /etc/nginx/sites-enabled/default
COPY ./entrypoint.sh /usr/local/bin/docker-php-entrypoint
RUN chmod +x /usr/local/bin/docker-php-entrypoint

EXPOSE 80

WORKDIR /var/www
