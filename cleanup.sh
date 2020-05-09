#!/bin/bash

echo "Stopping Slave Container"

echo "Stopping Master"

echo "Deleting Network"

echo "deleting master volume"
sudo rm -rf volumes/*

docker-compose rm -f