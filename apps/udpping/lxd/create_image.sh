#!/bin/bash
lxc launch ubuntu:16.04 redis-build
lxc file push ../generic/build_redis.sh redis-build/root/
lxc exec redis-build -- sh -c "chmod +x /root/build_redis.sh && /root/build_redis.sh"

lxc stop redis-build
lxc publish redis-build --alias redis
lxc delete redis-build