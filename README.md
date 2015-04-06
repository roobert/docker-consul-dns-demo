# docker consul DNS demo

## configure DNS clients

any machines you wish to be able to resolve docker container hostnames:

```
echo 'interface=docker0'          > /etc/NetworkManager/dnsmasq.d/docker
echo 'server=/dc0/127.0.0.1#8600' > /etc/NetworkManager/dnsmasq.d/consul
/etc/init.d/network-manager restart
```

## deploy containers

pick a method..

### docker

#### server
```
cd server && ./build.sh && ./run.sh
docker exec consul-agent ping -c5 consul-agent
```

#### client
```
cd agent && ./build.sh && ./run.sh
docker exec consul-agent ping -c5 consul-server
```

### docker registry

#### server
```
git pull roobert/consul-server:0.5.1-master && ./server/run.sh
docker exec consul-agent ping -c5 consul-agent
```

#### client
```
git pull roobert/consul-agent:0.5.1-master  && ./agent/run.sh &
docker exec consul-agent ping -c5 consul-server
```

### docker compose

```
docker-compose up -d
docker exec consul_agent_1 ping -c5 consul-server.node.dc0
docker exec consul_server_1 ping -c5 consul-server.node.dc0
docker-compose rm --force
```

## client testing

```
ping -c5 consul-server.node.dc0
ping -c5 consul-agent.node.dc0
```
