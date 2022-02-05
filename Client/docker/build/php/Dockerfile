FROM pockost/php:8.1-apache-bullseye

ENV APP_ENV=prod

COPY docker/build/php/php.ini /usr/local/etc/php
COPY docker/build/php/000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY . /var/www/html

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get update && apt-get install -y nodejs \
    && npm i -g yarn \
    && php -d memory_limit=-1 /usr/bin/composer install --no-dev --optimize-autoloader \
    && yarn install && yarn encore prod \
    && chown -R www-data:www-data var/cache var/log \
    && rm -rf /var/lib/apt/lists/*
