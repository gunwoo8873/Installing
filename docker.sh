#!/bin/bash

# Docker Shell Script File name and Process Number
echo '----------------------------------------------------'
echo 'Shell Script Debug :' $0, $$
echo '----------------------------------------------------'

echo '----------------------------------------------------'
echo '0. All Remove Cleanup'
docker container rm test_container
docker image rm choigunwoo/docker_test:a1.0.0
docker volume rm docker_volume
echo '----------------------------------------------------'

echo '----------------------------------------------------'
echo '1. Dockerfile Add Dcokerimage'
docker build -t choigunwoo/docker_test:a1.0.0 .
echo '----------------------------------------------------'

echo '----------------------------------------------------'
# Volume Create
echo '2. Volume Create'
docker volume create docker_volume
# Volume Information
echo '2.2 Volumne Inspect'
#docker volume inspect docker_volume
echo '----------------------------------------------------'

#docker run -v docker_volume:/src --name test-container touch /src/ .

echo '----------------------------------------------------'
echo '3. Container Create'
docker run -it --name test_container -v docker_volume:/src choigunwoo/docker_test:a1.0.0
echo '----------------------------------------------------'

echo '----------------------------------------------------'
echo '4. Docker Hub Image Push'
docker push choigunwoo/docker_test:a1.0.0
echo '----------------------------------------------------'