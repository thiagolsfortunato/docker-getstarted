#! /bin/bash

# access docker-machine myvm1
eval $(docker-machine env myvm1)

# redeploy with visualizer
docker stack deploy -c docker-compose.yml getstarted

# create folder on docker-machine myvm1
docker-machine ssh myvm1 "mkdir ./data"

# redeploy with redis db
docker stack deploy -c docker-compose.yml getstarted