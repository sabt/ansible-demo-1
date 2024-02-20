#!/usr/bin/env bash

set -e

base_dir=$(realpath "$0" )
base_dir=$(dirname "$base_dir" )
docker_dir="$base_dir/images/generate-keys"
current_user_id=$( id -u )

docker image build \
  -f "$docker_dir/Dockerfile" \
  --no-cache \
  --label "CUSTOMER=com.gft.devops-event" \
  --label "PROJECT=com.gft.devops-event.ansible-demo-1" \
  --label "MODULE=infrastructure" \
  --label "COMPONENT=generate-keys" \
  --label "NAME=main" \
  --label "SIGNATURE=com.gft.devops-event.ansible-demo-1.infrastructure.generate-keys.main" \
  --label "VERSION=1.0.0" \
  --tag "com.gft.devops-event.ansible-demo-1.infrastructure.generate-keys.main:1.0.0" \
  "$docker_dir"

docker container run \
  -t \
  --rm \
  --volume "/$base_dir/images:/mnt" \
  "com.gft.devops-event.ansible-demo-1.infrastructure.generate-keys.main:1.0.0" \
  bash -c "cd /data && \
    find . -maxdepth 1 -mindepth 1 -type d | \
    while read d ; do \
      if [[ ! -d "/mnt/\$d" ]] ; then continue ; fi ; \
      cp -vpR "/data/\$d/" "/mnt/" ; \
    done ; \
    chown -R $current_user_id:$current_user_id /mnt/ "
