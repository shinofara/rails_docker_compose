FROM mariadb:10.0

RUN usermod -u 1000 mysql
RUN mkdir -p /var/run/mysqld
RUN chmod -R 777 /var/run/mysqld

ADD ./conf.d /etc/mysql/conf.d
ADD ./init /docker-entrypoint-initdb.d