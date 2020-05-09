### POSTGRES DOCKER REPLICATION
Mini Project to show Postgres Replication in docker containers.  
Works with Postgres version 12

### Running the Containers
The Containers can be run by either the docker cli or using docker-compose  

#### 1 to CLI RUN the install.sh with a user in docker group or a sudoer

    ./install.sh 

install.sh will perform the following steps
- Builds master and slave images
- Creates the test network
- Creates docker volumes
- Starts the Containers


Cleaning up after  the ./install script  
Run ./cleanup.sh to delete all resources used in the install script
    
    ./cleanup.sh

#### 2 Running with Docker compose

    docker-compose up -d --build # run containers in detached mode

Cleaning Up docker-compose install

    docker-compose down --rmi all -v


### Testing  
Access the master-db container

    docker exec -it master-db /bin/sh # install script

    or

    docker-compose exec master-db /bin/sh # compose file

Create a Database

    psql -U test -c "CREATE DATABASE replicatest;"


Verify Replication by Accessing Slave Container

    docker exec -it replica-db /bin/sh # install script

    or

    docker-compose exec replica-db /bin/sh # compose file

Confirm DB is listed

    psql -U test -c "\l"

