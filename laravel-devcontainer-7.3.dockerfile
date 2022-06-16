# [Choice] PHP version (use -bullseye variants on local arm64/Apple Silicon): 8, 8.1, 8.0, 7, 7.4, 7.3, 8-bullseye, 8.1-bullseye, 8.0-bullseye, 7-bullseye, 7.4-bullseye, 7.3-bullseye, 8-buster, 8.1-buster, 8.0-buster, 7-buster, 7.4-buster
ARG VARIANT=8-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/php:0-${VARIANT}

# Install MariaDB client and other PHP dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get install -y\
  # Compilation dependencies
  libmcrypt-dev\
  libpng-dev\
  libjpeg62-turbo-dev\
  libfreetype6-dev\
  libzip-dev\
  libwebp-dev\
  # useful tools
  mariadb-client\
  git\
  bash-completion\
  cron\
  && docker-php-ext-configure gd --with-freetype-dir --with-jpeg-dir --with-png-dir --with-webp-dir \
  && docker-php-ext-install pdo_mysql gd exif zip mysqli pdo \
  && pecl install mcrypt \
  # && pecl install xdebug \
  && docker-php-ext-enable mcrypt \
  # && docker-php-ext-enable xdebug \
  && apt-get purge -y libmcrypt-dev libpng-dev libjpeg62-turbo-dev libfreetype6-dev libzip-dev\
  && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Switch xdebug back to the default port
RUN sed -i -e "s/xdebug.client_port = 9000/xdebug.client_port = 9003/" -e "s/xdebug.mode = debug/xdebug.mode = develop,debug/" /usr/local/etc/php/conf.d/xdebug.ini\
  && echo "xdebug.discover_client_host=1\
  xdebug.client_host=host.docker.internal"

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="lts/*"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

