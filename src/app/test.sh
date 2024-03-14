#!/bin/bash


# Container
i = --interactive || -i
t = --tty || -t
# Image

# Volume

# Options
name = --name
remove = --remove
rm = --rm

echo "Container Create"
docker container create name

echo "Container Remove" ${name}
docker container remove ${name}