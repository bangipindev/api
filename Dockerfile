FROM php:8.2-fpm

COPY composer.* /var/www/

WORKDIR /var/www

RUN apt-get update && apt-get install -y \
zip \
unzip \
locales \
libmcrypt-dev \
libfreetype-dev \
libzip-dev \
libpng-dev \
libjpeg62-turbo-dev \
libwebp-dev \
git \
curl \
zlib1g-dev \
postgresql \ 
postgresql-client \
libpq-dev \
vim 

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql pgsql
RUN docker-php-ext-install gd
RUN docker-php-ext-install zip

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

COPY . .

COPY --chown=www:www . .

USER www

EXPOSE 9000

CMD [ "php-fpm" ]
