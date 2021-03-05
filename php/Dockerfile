ARG PHP_VERSION
FROM php:${PHP_VERSION}

# update
RUN apk update

ARG UID
RUN apk --no-cache add shadow && usermod -u ${UID} www-data

# # Locales
# ENV MUSL_LOCALE_DEPS cmake make musl-dev gcc gettext-dev libintl 
# ENV MUSL_LOCPATH /usr/share/i18n/locales/musl

# RUN apk add --no-cache \
#     $MUSL_LOCALE_DEPS \
#     && wget https://gitlab.com/rilian-la-te/musl-locales/-/archive/master/musl-locales-master.zip \
#     && unzip musl-locales-master.zip \
#       && cd musl-locales-master \
#       && cmake -DLOCALE_PROFILE=OFF -D CMAKE_INSTALL_PREFIX:PATH=/usr . && make && make install \
#       && cd .. && rm -r musl-locales-master

# # Set the lang, you can also specify it as as environment variable through docker-compose.yml
# ENV LC_ALL fr_FR.UTF-8
# ENV LANG en_US.UTF-8
# ENV LANGUAGE en_US.UTF-8

# # install utils
# RUN apk add --no-cache zlib-dev icu-dev g++ \
#     freetype libpng libjpeg-turbo \
#     freetype-dev libpng-dev libjpeg-turbo-dev #g++ ?

# RUN mkdir /usr/local/log; \
#     mkdir /usr/local/log/php; \
#     chmod -R 755 /usr/local/log

# # install intl MySQLi gd
# RUN docker-php-ext-configure intl
# RUN docker-php-ext-configure gd --with-freetype --with-jpeg
# RUN docker-php-ext-configure exif
# RUN docker-php-ext-install -j$(nproc) mysqli intl gd exif

# RUN sed -i "s/;php_admin_flag/php_admin_flag/g" /usr/local/etc/php-fpm.d/www.conf \
# && sed -i "s/;php_admin_value\[error_log\]/php_admin_value\[error_log\]/g" /usr/local/etc/php-fpm.d/www.conf \
# && sed -i "s/;catch_workers_output/catch_workers_output/g" /usr/local/etc/php-fpm.d/www.conf

RUN { \
        echo 'short_open_tag = Off'; \
        echo 'expose_php = Off'; \
        echo 'error_reporting = E_ALL & ~E_STRICT'; \
        echo 'log_errors = On'; \
        echo 'catch_workers_output = yes'; \
        echo 'display_errors = On'; \
        echo 'error_log = /var/log/php/php_errors.log'; \
        echo 'upload_tmp_dir = /tmp/'; \
        echo 'allow_url_fopen = on'; \
        echo 'upload_max_filesize = 10M'; \
        echo 'post_max_size = 12M'; \
#         echo '[xdebug]'; \
#         echo 'zend_extension="xdebug.so"'; \
#         echo 'xdebug.remote_enable = 1'; \
#         echo 'xdebug.remote_port = 9001'; \
#         echo 'xdebug.remote_autostart = 1'; \
#         echo 'xdebug.remote_connect_back = 0'; \
#         echo 'xdebug.remote_host = host.docker.internal'; \
#         echo 'xdebug.idekey = VSCODE'; \
#         echo '[redis]'; \
#         echo 'extension="igbinary.so"'; \
#         echo 'extension="redis.so"'; \
#         echo 'session.save_handler = "redis"'; \
#         echo 'session.save_path = "tcp://redis-localhost:6379?weight=1&timeout=2.5"'; \
    } > /usr/local/etc/php/conf.d/php-config.ini