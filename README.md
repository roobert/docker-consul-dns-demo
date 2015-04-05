# Docker Consul DNS Demo

```
echo 'interface=docker0'           > /etc/NetworkManager/dnsmasq.d/docker
echo 'server=/robs/127.0.0.1#8600' > /etc/NetworkManager/dnsmasq.d/consul
/etc/init.d/network-manager restart
```

```
docker-compose up
docker exec consul_agent_1 ping -c5 consul-server.node.robs
ping -c5 consul-server.node.robs
ping -c5 consul-agent.node.robs
```
