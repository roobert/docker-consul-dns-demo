#!/bin/bash
docker run \
  --rm \
  -ti \
  -h consul-agent \
  --name=consul-agent \
  --dns=172.17.42.1 \
  --dns-search=node.dc0 \
  --link consul-server:consul-server \
  roobert/consul-agent:0.5.1-master
