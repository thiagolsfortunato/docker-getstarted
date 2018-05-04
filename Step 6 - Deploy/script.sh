#! /bin/bash

# connect docker swarm on cloud
docker run -ti --rm -v /var/run/docker.sock:/var/run/docker.sock dockercloud/registration