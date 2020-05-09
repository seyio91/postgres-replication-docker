#!/bin/bash

echo "Stopping Slave Container"

echo "Stopping Master"

echo "Deleting Network"

echo "deleting master volume"
sudo rm -rf master_data/

echo "deleting slave volume"
sudo rm -rf slave_data/

docker-compose rm -f