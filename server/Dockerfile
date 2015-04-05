FROM ubuntu:14.10

MAINTAINER Rob Zissou <roobert@gmail.com>

ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get install -y software-properties-common:
RUN apt-get update
RUN add-apt-repository ppa:roobert/consul         
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y consul consul-web-ui

ADD files/consul.json /etc/consul.d/20-agent.json

CMD consul agent -config-dir /etc/consul.d/ -server -bootstrap -ui-dir /ui
