FROM mysql

COPY ./migrations/init.sql /docker-entrypoint-initdb.d/init.sql
ENV MYSQL_DATABASE=shoppingcart-db
ENV MYSQL_USER=admin
ENV MYSQL_PASSWORD=password
