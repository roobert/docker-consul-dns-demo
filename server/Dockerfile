FROM ubuntu:14.10

MAINTAINER Rob Zissou <roobert@gmail.com>

ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:roobert/consul         
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y consul consul-web-ui

EXPOSE 8400 8500 8600

ENTRYPOINT [ "consul", "agent", "-server", "-bootstrap" ]

CMD [ \
  "-dc",         "dc0",             \
  "-domain",     "dc0",             \
  "-client",     "0.0.0.0",         \
  "-recursor",   "8.8.8.8",         \
  "-ui-dir",     "/ui",             \
  "-data-dir",   "/var/lib/consul", \
  "-config-dir", "/etc/consul.d/",  \
  "-log-level",  "trace"            \
]
