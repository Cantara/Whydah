#!/bin/sh

# Lets create sts-mesh for hazelcast
sudo socketplane network create sts-mesh 10.2.0.0/16

# Lets create SSO Login Load balancer network
sudo socketplane network create ssologin-lb 10.4.0.0/16

# Lets create UAS QoS load balancer network
sudo socketplane network create web 10.4.0.0/16


