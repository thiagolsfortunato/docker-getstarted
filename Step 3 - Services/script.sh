#! /bin/bash

# inicialize swarm mode
docker swarm init

# deploy stack using docker-compose.yaml file
docker stack deploy -c docker-compose.yaml getstarted

# list all services
docker service ls

# list all containers on service getstarted_web
docker service ps getstarted_web

# remove stack getstarted
docker stack rm getstarted

# leave swarm mode
docker swarm leave --force