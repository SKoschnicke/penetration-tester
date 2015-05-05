#!/bin/sh

# This script starts the program in the docker container. It is meant
# for testing the program. When the program is finished, it should be
# build into the container image and started by starting a new
# container from the build image (without the working directory bound
# into the container).

set -eux

source ./config.sh

docker run -it \
  -e BUNDLE_PATH=/usr/src/app/.bundle \
  -e BUNDLE_GEMFILE=/usr/src/app/Gemfile \
  -v "$PWD":/usr/src/app \
  -w /usr/src/app \
  "$DOCKER_IMAGE_NAME" \
  bundle exec /usr/src/app/pentest.rb
