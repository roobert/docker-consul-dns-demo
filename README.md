# docker consul DNS demo

## configure docker host

to be able to resolve docker container hostnames:

```
echo 'interface=docker0'          > /etc/NetworkManager/dnsmasq.d/docker
echo 'server=/dc0/127.0.0.1#8600' > /etc/NetworkManager/dnsmasq.d/consul
/etc/init.d/network-manager restart
```

## deploy containers

pick a method:

* docker (build|fetch)
* docker-compose

### docker

build or fetch..

#### build

```
( cd server && ./build.sh )
( cd agent && ./build.sh )
```

#### fetch

```
git pull roobert/consul-server:0.5.1-master
git pull roobert/consul-agent:0.5.1-master

```

#### run

```
./server/run.sh &
./agent/run.sh &
```

#### test containers

```
docker exec consul-agent ping -c5 consul-agent
docker exec consul-agent ping -c5 consul-server
```

### docker compose

#### create

```
docker-compose up
```

#### test

```
docker exec consul_agent_1 ping -c5 consul-server.node.dc0
docker exec consul_server_1 ping -c5 consul-server.node.dc0
```

#### destroy

```
docker-compose rm --force
```

## test docker host

```
ping -c5 consul-server.node.dc0
ping -c5 consul-agent.node.dc0
```
