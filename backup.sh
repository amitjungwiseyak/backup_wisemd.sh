#!/bin/bash

#checks for postgres container 

echo "CHECKING FOR THE POSTGRES CONTAINER."
POSTGRES_CONTAINER_ID=$(docker ps --filter "ancestor=postgres:16.1" --format {{.ID}})

 [ -z "$POSTGRES_CONTAINER_ID" ] && echo "WARNING:POSTGRES container may not be running" && exit 1;

 #pg_dump the sql file

 STORED_FILE=$(date +"%m-%d_%H-%M")-$(hostname).sql

echo "PGDUMP SQL file."
 docker exec -t $POSTGRES_CONTAINER_ID pg_dump -U keycloak -d wisemd > $STORED_FILE

echo $POSTGRES_CONTAINER_ID; 
echo "stored in $STORED_FILE"

#scp into created file into another

echo"SCP into vm1........."
scp -i /home/ubuntu/.ssh/id_rsa $STORED_FILE ubuntu@103.90.86.42:/tmp
