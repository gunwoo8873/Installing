#!/bin/bash
echo " Param = $# "

# Output Display


# Option
option=""
tag_version=""

# Container
container_name=""
container_option=""

# ?
create_container() {
    echo "Container Create $container_name, $image_name"
    docker container create $container_option $container_name $image_name:$tag_version
}

# Volume
volume_name=""

create_volume() {
    echo "Volume Create $volume_name"
    docker volume create $volume_name
}

# Image
image_name=""
dockerhub_repository=""

# Dockerhub Push Build Image
echo "Docker Hub Push to Build Image"
docker push "$dockerhub_repository:$tag_version"