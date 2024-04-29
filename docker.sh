#!/bin/bash

# Docker Shell Script File name and Process Number
echo 'Shell Script Debug :' $0, $$
echo \n

echo '0. All Remove Cleanup'
docker container rm test_container
docker image rm choigunwoo/docker_test:a1.0.0
docker volume rm docker_volume
echo '----------------------------------------------------'

echo '1. Dockerfile Add Dcokerimage'
docker build -t choigunwoo/docker_test:a1.0.0 .
echo '----------------------------------------------------'

# Volume Create
echo '2. Volume Create'
#docker volume create docker_volume
# Volume Information
echo '2.2 Volumne Inspect'
#docker volume inspect docker_volume
echo '----------------------------------------------------'

#docker run -v docker_volume:/src --name test-container touch /src/ .

echo '3. Container Create'
docker run -it --name test_container choigunwoo/docker_test:a1.0.0
echo '----------------------------------------------------'

echo '4. Docker Hub Image Push'
docker push choigunwoo/docker_test:a1.0.0
echo '----------------------------------------------------'
