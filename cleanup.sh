#!/bin/bash

echo "Stopping Slave Container"
docker stop replica-db

echo "Stopping Master"
docker stop master-db

echo "Deleting Network"
docker network rm test

echo "deleting master volume"
sudo rm -rf volumes/*

echo "Deleting Docker Images"
docker rmi replication-slave
docker rmi replication-master
