#!/bin/bash
lxc launch ubuntu:16.04 udpping-build
lxc file push ../generic/build_udpping.sh udpping-build/root/
lxc exec udpping-build -- sh -c "chmod +x /root/build_udpping.sh && /root/build_udpping.sh"

lxc stop udpping-build
lxc publish udpping-build --alias udpping
lxc delete udpping-build