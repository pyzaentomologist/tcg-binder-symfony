# Dockerfile

FROM php:8.2-fpm

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    git \
    libicu-dev \
    unzip

RUN docker-php-ext-install pdo pdo_mysql intl opcache

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN composer create-project symfony/skeleton tcg-binder

CMD ["php-fpm"]