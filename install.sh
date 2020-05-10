#!/bin/bash
# ==========================================================
# install script for running the docker postgres replication scenario
# postgres containers are started without any password
# to use a password, delete the environment variable 
# POSTGRES_HOST_AUTH_METHOD and Replace with POSTGRES_PASSWORD
# ===========================================================
echo "Building Master Image"
docker build -t replication-master -f ./master/Dockerfile ./master

echo "Build Replica Image"
docker build -t replication-slave -f ./slave/Dockerfile ./slave

echo "Creating Network"
docker network create -d bridge test

echo "Creating Volumes Directory"
docker volume create master-data
docker volume create slave-data

echo "Starting Master in Detached Mode"
docker run \
    --name master-db \
    --rm -d \
    --network test \
    -e POSTGRES_USER=test \
    -e POSTGRES_HOST_AUTH_METHOD=trust \
    -e POSTGRES_DB=test \
    -e PG_REP_USER=replicator \
    -v master-data:/var/lib/postgresql/data \
    -p 15432:5432 \
    replication-master

# wait if using command line
sleep 3s

echo "Starting Slave"
docker run \
    --name replica-db \
    --rm -d \
    --network test \
    -e POSTGRES_USER=test \
    -e POSTGRES_HOST_AUTH_METHOD=trust \
    -e POSTGRES_DB=test \
    -e PG_REP_USER=replicator \
    -v slave-data:/var/lib/postgresql/data \
    -p 15433:5432 \
    replication-slave
