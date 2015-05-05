#!/bin/sh

# This script creates a new Gemfile.lock based on the contents of
# Gemfile and downloads required gem into .bundle directory of the
# project home. Therefor all is set for executing the script
# afterwards. Make sure that the two environment variables are also
# set to the same paths when running the ruby script.
docker run --rm \
  -e BUNDLE_PATH=/usr/src/app/.bundle \
  -e BUNDLE_GEMFILE=/usr/src/app/Gemfile \
  -v "$PWD":/usr/src/app \
  -w /usr/src/app \

    ruby:2.2 \
  bundle install
