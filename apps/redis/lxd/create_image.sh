#!/bin/bash
lxc launch ubuntu:16.04 nginx-build
lxc file push ../generic/build_redis.sh nginx-build/root/
lxc exec udpping-build -- sh -c "chmod +x /root/build_udpping.sh && /root/build_udpping.sh"

lxc stop nginx-build
lxc publish nginx-build --alias nginx
lxc delete nginx-build