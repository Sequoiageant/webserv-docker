ARG PMA_VERSION
FROM phpmyadmin/phpmyadmin:${PMA_VERSION}

# RUN mkdir -p /cert

# COPY ./certs/cert.crt /cert/
# COPY ./certs/cert.key /cert/

# # RUN chown -R root:root /certs/cert.crt
# # RUN chown -R root:root /certs/cert.key && chmod 440 /certs/cert.key

# RUN a2enmod ssl

# RUN sed -ri -e 's,80,443,' /etc/apache2/sites-available/000-default.conf
# RUN sed -i -e '/^<\/VirtualHost>/i SSLEngine on' /etc/apache2/sites-available/000-default.conf
# RUN sed -i -e '/^<\/VirtualHost>/i SSLCertificateFile /cert/cert.crt' /etc/apache2/sites-available/000-default.conf
# RUN sed -i -e '/^<\/VirtualHost>/i SSLCertificateKeyFile /cert/cert.key' /etc/apache2/sites-available/000-default.conf
# # RUN sed -i -e '/^<\/VirtualHost>/i SSLCertificateChainFile /cert/fullchain.pem' /etc/apache2/sites-available/000-default.conf

# EXPOSE 443
