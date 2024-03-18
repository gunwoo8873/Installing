#!/bin/bash

# Option

# Container
container_name="$@"
container_option="$@"

case $container_option in
    "-it")
        echo "create container $container_name"
        docker container create "$container_option" --name "$container_name" "$bulde_image"
esac

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

rename_container(){
    echo "rename container $container_name to $container_name"
    docker container rename "$container_name" "$container_name"
}
rename_container


# Image
bulde_image="$@"