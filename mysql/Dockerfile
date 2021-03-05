ARG MYSQL_VERSION
FROM mysql:${MYSQL_VERSION}

ARG UID
RUN usermod -u ${UID} mysql
COPY ./my.cnf /etc/mysql/

# RUN chown root:root /etc/mysql/my.cnf

# RUN mkdir -p /tmp/
# COPY secure_safran_dev.sql /tmp/
# COPY mysql_init.sh /usr/local/bin/

# CMD ["mysql_init.sh"]