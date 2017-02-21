#!/bin/bash
lxc launch ubuntu:16.04 nginx-build
lxc file push ../generic/build_nginx.sh nginx-build/root/
lxc exec nginx-build -- sh -c "chmod +x /root/build_nginx.sh && /root/build_nginx.sh"

lxc stop nginx-build
lxc publish nginx-build --alias nginx
lxc delete nginx-build