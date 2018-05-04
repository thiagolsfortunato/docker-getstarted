#! /bin/bash

#
# Always run docker swarm init and docker swarm join with port 2377 (the swarm management port), 
# or no port at all and let it take the default.
#

#create 2 docker-machines
docker-machine create --driver virtualbox myvm1
docker-machine create --driver virtualbox myvm2

# list docker-machines
docker-machine ls

# connect to docker-machine myvm1 and inicialize swarm mode
docker-machine ssh myvm1 "docker swarm init --advertise-addr [myvm1 ip]"

# get token on myvm1 to add worker
docker-machine ssh myvm1 "docker swarm join-token worker"

# add worker to myvm1 swarm 
docker swarm join --token [token] [myvm ip]:[port]

# get token on myvm1 to add worker
docker-machine ssh myvm1 "docker swarm join-token worker"

# add myvm2 as worker on myvm1
docker-machine ssh myvm2 "docker swarm join --token [myvm1-token] [myvm1 ip]:2377"

# list on the manager to view the nodes in this swarm
docker-machine ssh myvm1 "docker node ls"

# get configuration to talk with myvm1/myvm2
docker-machine env [myvm1/myvm2]

# enter inside docker-machine
eval $(docker-machine env [myvm1/myvm2])

# Note: If your image is stored on a private registry instead of Docker Hub, 
# you need to be logged in using docker login <your-registry> and 
# then you need to add the --with-registry-auth flag
docker login 

docker stack deploy --with-registry-auth -c docker-compose.yaml getstarteds

# list stack deploy
docker stack ps getstartedlab