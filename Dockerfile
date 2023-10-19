FROM php:8.0-fpm

COPY composer.* /var/www/

WORKDIR /var/www

RUN apt-get update && apt-get install -y \
zip \
unzip \
locales \
libmcrypt-dev \
libzip-dev \
libpng-dev \
libjpeg62-turbo-dev \
libwebp-dev \
git \
curl

RUN apt-get clean && rm -rf /var/lib/apt/lists/*


RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install gd
RUN docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

COPY . .

COPY --chown=www:www . .

USER www

EXPOSE 9000

CMD [ "php-fpm" ]
