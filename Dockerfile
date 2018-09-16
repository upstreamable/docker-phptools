FROM php:7-alpine

MAINTAINER Rodrigo Aguilera <hi@rodrigoaguilera.net>

ENV COMPOSER_VERSION=1.7.2

ENV COMPOSER_BIN_DIR=/usr/local/bin

RUN curl https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar -o /usr/local/bin/composer && \
  chmod +x /usr/local/bin/composer

RUN apk add git

RUN composer global config repositories.foo '{"type": "git", "url": "https://github.com/pfrenssen/coder"}' && \
  composer global require dealerdirect/phpcodesniffer-composer-installer && \
  composer global require drupal/coder:dev-8.x-2.x && \
  phpcs --config-set default_standard PSR12

WORKDIR /mnt
