#!/bin/sh

# This script exports the build docker image and imports it on the
# server to be used there.

source ./build-config.sh

# temporarly archive name for export
ARCHIVE_FILE=penetration_tester_image.tar

rm "$ARCHIVE_FILE"
docker build -t "$DOCKER_IMAGE_NAME" .
docker save "$DOCKER_IMAGE_NAME" > "$ARCHIVE_FILE"
scp "$ARCHIVE_FILE" "$DEPLOY_TO_SERVER":.
ssh "$DEPLOY_TO_SERVER" "docker load < \"$ARCHIVE_FILE\""
