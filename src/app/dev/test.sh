#!/bin/bash

# Options
container_name="$2"
container_option="$1"

create_container(){
    echo "create container $container_name"
    docker container create "$container_option" --name "$container_name" "$bulde_image"
}
create_container

remove_container(){
    echo "remove container $container_name"
    docker rm container "$container_name"
}
remove_container


# Image
bulde_image="$3"