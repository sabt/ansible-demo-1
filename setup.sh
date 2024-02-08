#!/usr/bin/env bash

base_dir=$(dirname $0)
docker_dir="$base_dir/images/preparation"

docker image build \
  -f "$docker_dir/Dockerfile" \
  --label "CUSTOMER=com.gft.devops-event" \
  --label "PROJECT=com.gft.devops-event.ansible-demo-1" \
  --label "MODULE=infrastructure" \
  --label "COMPONENT=keys" \
  --label "NAME=main" \
  --label "SIGNATURE=com.gft.devops-event.ansible-demo-1.infrastructure.keys.main" \
  --label "VERSION=1.0.0" \
  --tag "com.gft.devops-event.ansible-demo-1.infrastructure.keys.main:1.0.0" \
  "$docker_dir"
