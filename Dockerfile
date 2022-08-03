FROM php:5.4-apache

COPY . /var/www/html

WORKDIR /var/www/html

RUN docker-php-ext-install mysql mysqli

EXPOSE 80
EXPOSE 3306
