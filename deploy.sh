#!/bin/sh

IMAGE_NAME=ruby-with-nmap
ARCHIVE_FILE=penetration_tester_image.tar
TARGET_SERVER=database-perfavo

rm "$ARCHIVE_FILE"
docker build -t "$IMAGE_NAME" .
docker save "$IMAGE_NAME" > "$ARCHIVE_FILE"
scp "$ARCHIVE_FILE" "$TARGET_SERVER":.
ssh "$TARGET_SERVER" "docker load < \"$ARCHIVE_FILE\""
