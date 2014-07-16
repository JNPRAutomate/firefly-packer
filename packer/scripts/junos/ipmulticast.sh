#!/bin/sh -x
# IP Multicast TTL fix
sysctl -w net.inet.ip.mcast_ttl=64
chmod 777 /cf/etc/rc.custom
