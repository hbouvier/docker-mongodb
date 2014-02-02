# docker-mongodb

## To build the container

> ./build

## To run the container

> ./run

## To link another container to this instance

The 'run' script will name the container 'mongodb' and the Dockerfile export the mongodb default port 27017.
Therefore the environment variable will be prexied with 'mongodb'_PORT_'27017'_TCP_ and ADDR for the ip address and PORT for the port

> docker run -link mongodb:mongodb YOUR_CONTAINER
> USE the following environment variable MONGODB_PORT_27017_TCP_ADDR and MONGODB_PORT_27017_TCP_PORT

