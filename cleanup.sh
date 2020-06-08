#!/bin/bash

echo "Stopping master Container"
docker stop master-db

echo "Stopping slave Container"
docker stop replica-db

echo "Deleting Test Network"
docker network rm test

echo "deleting volume"
docker volume rm master-data
docker volume rm slave-data

echo "Deleting Docker Images"
docker rmi replication-slave
docker rmi replication-master
