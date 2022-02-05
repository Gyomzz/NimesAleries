FROM pockost/php:8.1-apache-bullseye

ARG COMPOSE_UID
ARG COMPOSE_GID

RUN if ! getent group $COMPOSE_GID; \
    then addgroup --gid $COMPOSE_GID developer; fi \
    && adduser --disabled-password --uid $COMPOSE_UID --gid $COMPOSE_GID --gecos "" developer \
    && chown -R $(getent passwd $COMPOSE_UID | awk -F : '{print $1}'):$(getent group $COMPOSE_GID | awk -F : '{print $1}') /var/log/apache2 \
    && chown -R $(getent passwd $COMPOSE_UID | awk -F : '{print $1}'):$(getent group $COMPOSE_GID | awk -F : '{print $1}') /var/run/apache2 \
    && sed -i "s/^Listen 80/Listen 8080/" /etc/apache2/ports.conf \
    && export APACHE_RUN_USER=$(getent passwd $COMPOSE_UID | awk -F : '{print $1}') \
    && export APACHE_RUN_GROUP=$(getent group $COMPOSE_GID | awk -F : '{print $1}') \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get update && apt-get install -y nodejs \
    && npm i -g yarn

USER developer
