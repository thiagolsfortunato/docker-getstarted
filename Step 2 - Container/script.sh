#! /bin/bash#

# install requirements python
pip install requirements.txt

# build image docker
docker build -t friendlyhello .

# run container
docker run -p 4000:80 friendlyhello

# list containers
docker container ls

# create tag
docker tag friendlyhello john/get-started:part2

# push to docker hub
docker push john/get-started:part2

# run container based image you have pushed
docker run -p 4000:80 john/get-started:part2