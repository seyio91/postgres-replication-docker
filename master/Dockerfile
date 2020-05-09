FROM postgres:latest

COPY ./init-primary.sh /docker-entrypoint-initdb.d/init-primary.sh

RUN chmod 0666 /docker-entrypoint-initdb.d/init-primary.sh