#!/bin/sh
set -eux
docker run -it \
  -e BUNDLE_PATH=/usr/src/app/.bundle \
  -e BUNDLE_GEMFILE=/usr/src/app/Gemfile \
  -v "$PWD":/usr/src/app \
  -w /usr/src/app \
  ruby-with-nmap \
  bundle exec /usr/src/app/pentest.rb
