#! /bin/bash

# based Ubunt SO

# ============================================== #

# UNINTALL OLD VERSIONS
sudo apt-get remove docker docker-engine docker.io

# ============================================== #

# INSTALL USING REPOSITORY

# update apt packages
sudo apt-get update 

# install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# add oficial GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# update apt packages
sudo apt-get update 

# install docker-ce
sudo apt-get install docker-ce

# ============================================ #

# INSTALL USING THE CONVENIENCE SCRIPT

# get script to install docker-ce
curl -fsSL get.docker.com -o get-docker.sh && chmod +x get-docker.sh

# run script
sudo sh get-docker.sh

# ============================================ #

# UNINSTALL DOCKER-CE

# uninstall docker-ce from apt
sudo apt-get purge docker-ce

# remove folders
sudo rm -rf /var/lib/docker && sudo rm -rf /etc/docker

# ============================================ #

# POST INSTALLATION

# create docker group
sudo groupadd docker

# add your user to the docker group.
sudo usermod -aG docker $USER

# configure to star on boot
sudo systemctl enable docker