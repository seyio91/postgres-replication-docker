#!/bin/bash

# echo "Building Master Image"
# docker build -t replication-master -f ./master/Dockerfile ./master

# echo "Build Replica Image"
# docker build -t replication-slave -f ./slave/Dockerfile ./slave

echo "Creating Network"
docker network create -d bridge test

echo "Starting Master in Detached Mode"
docker run \
    --name master-db \
    --rm \
    --network test \
    -e POSTGRES_USER=test \
    -e POSTGRES_PASSWORD='' \
    -e POSTGRES_DB=test \
    -e PG_REP_USER=replicator \
    -v $(pwd)/master_data:/var/lib/postgresql/data \
    -p 15432:5432 \
    replication-master

echo "Starting Slave"