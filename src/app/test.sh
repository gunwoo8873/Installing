#!/bin/bash

container_name = --name
remove = --remove
rm = --rm

echo "Container Create"
docker container create ${container_name}

echo "Container Remove
docker container remove ${container_name}