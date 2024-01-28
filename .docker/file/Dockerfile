FROM php:8.3-fpm-alpine

RUN apk --update add \ 
    wget \
    curl \
    git \
    grep \
    build-base \
    libmemcached-dev \
    libmcrypt-dev \
    libxml2-dev \
    libxslt-dev \
    libzip-dev \
    libxpm-dev \
    imagemagick-dev \
    pcre-dev \
    libtool \
    make \
    autoconf \
    g++ \
    cyrus-sasl-dev \
    libgsasl-dev \
    automake \
    bash \
    shadow

RUN apk add nodejs npm

RUN docker-php-ext-install \
    mysqli \
    xsl \
    xml \
    pdo \
    pdo_mysql \
    zip \
    opcache

RUN curl -O https://getcomposer.org/download/2.3.10/composer.phar \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer

RUN usermod -u 1000 www-data \
    && groupmod -g 1000 www-data