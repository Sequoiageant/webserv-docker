ARG APACHE_VERSION
FROM httpd:${APACHE_VERSION}

# update OS and install utils
RUN apt-get update && apt-get install -y \
#     vim \
    && apt-get -yq autoremove;

RUN mkdir /usr/local/log; \
    mkdir /usr/local/log/apache2; \
    chmod -R ug+w /usr/local/log

COPY ./certs/cert.crt /etc/ssl/certs/
COPY ./certs/cert.key /etc/ssl/private/
RUN chown -R root:root /etc/ssl/certs/cert.crt
RUN chown -R root:root /etc/ssl/private/cert.key && chmod 440 /etc/ssl/private/cert.key

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /usr/local/log/apache2

Run sed -i "s/User\ daemon/User\ www-data/" /usr/local/apache2/conf/httpd.conf;
Run sed -i "s/Group\ daemon/Group\ www-data/" /usr/local/apache2/conf/httpd.conf;
Run sed -i "s/Listen\ 80/Listen 80\nListen\ 443/" /usr/local/apache2/conf/httpd.conf;
RUN sed -i "s/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/" /usr/local/apache2/conf/httpd.conf;
RUN sed -i "s/#LoadModule\ proxy_module/LoadModule\ proxy_module/" /usr/local/apache2/conf/httpd.conf;
RUN sed -i "s/#LoadModule\ http2_module/LoadModule\ http2_module/" /usr/local/apache2/conf/httpd.conf;
RUN sed -i "s/#LoadModule\ ssl_module/LoadModule\ ssl_module/" /usr/local/apache2/conf/httpd.conf;
RUN sed -i "s/#LoadModule\ proxy_fcgi_module/LoadModule\ proxy_fcgi_module/" /usr/local/apache2/conf/httpd.conf;

# Copy apache vhost file to proxy php requests to php-fpm container
COPY ./vhosts/sdlv.local.conf /usr/local/apache2/conf/sdlv.local.conf
RUN echo "Include /usr/local/apache2/conf/sdlv.local.conf" \
    >> /usr/local/apache2/conf/httpd.conf

COPY ./vhosts/default.local.conf /usr/local/apache2/conf/default.local.conf
RUN echo "Include /usr/local/apache2/conf/default.local.conf" \
    >> /usr/local/apache2/conf/httpd.conf

# COPY ./pma.local.conf /usr/local/apache2/conf/pma.local.conf
# RUN echo "Include /usr/local/apache2/conf/pma.local.conf" \
#     >> /usr/local/apache2/conf/httpd.conf
