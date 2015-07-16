#!/bin/sh

# This script builds the container. The current version of the program
# is copied into the container so that the image can be used
# standalone to start the program.

source ./build-config.sh

docker build -t "$DOCKER_IMAGE_NAME" .
