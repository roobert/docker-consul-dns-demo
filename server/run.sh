#!/usr/bin/env bash

docker run \
  --rm \
  -P \
  -ti \
  -h consul-server \
  --name=consul-server \
  --dns=172.17.42.1 \
  --dns-search=node.dc0 \
  -p 8400:8400 -p 8500:8500 -p 8600:8600/udp \
  roobert/consul-server:0.5.1-master
