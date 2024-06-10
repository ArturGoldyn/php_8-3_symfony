FROM php:8.3

RUN apt update -yqq
RUN apt install -yqq git libmcrypt-dev libpq-dev libcurl4-gnutls-dev libicu-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev unzip
RUN apt install -yqq libzip-dev
RUN apt install -yqq libonig-dev
RUN docker-php-ext-install gmp
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install curl
RUN docker-php-ext-install intl
RUN docker-php-ext-install gd
RUN docker-php-ext-install xml
RUN docker-php-ext-install bz2
RUN docker-php-ext-install opcache
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN curl -sS https://getcomposer.org/installer | php
RUN chmod +x composer.phar
RUN mv /composer.phar /usr/bin/composer.phar
RUN ln /usr/bin/composer.phar /usr/bin/composer
RUN apt install -yqq python3
RUN adduser --disabled-password -gecos "" application
RUN apt -y install screen netcat-traditional default-mysql-client

