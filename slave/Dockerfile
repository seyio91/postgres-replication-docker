FROM postgres:latest

# needed for wait in the init file
RUN apt-get update && apt install -y iputils-ping

COPY ./init-secondary.sh /docker-entrypoint-initdb.d/init-secondary.sh

RUN chmod +x /docker-entrypoint-initdb.d/init-secondary.sh

ENTRYPOINT ["/docker-entrypoint-initdb.d/init-secondary.sh"]

CMD ["gosu","postgres","postgres"]