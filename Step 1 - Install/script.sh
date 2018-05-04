#! /bin/bash

# docker version
docker --version

# details about docker installation
docker info

# test docker
docker run hello-word

# list images
docker image ls

# list all containers
docker containers ls --all

# list all containers in quiet mode
docker containers ls -aq