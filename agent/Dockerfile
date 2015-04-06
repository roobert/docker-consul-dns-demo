FROM ubuntu:14.10

MAINTAINER Rob Zissou <roobert@gmail.com>

ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:roobert/consul
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y consul

ENTRYPOINT [ "consul", "agent" ]

CMD [ \
  "-config-dir", "/etc/consul.d/",         \
  "-dc", "dc0",                            \
  "-retry-join", "consul-server.node.dc0", \
  "-retry-interval", "10s",                \
  "-data-dir", "/var/lib/consul"           \
]
