#!/bin/sh
rumprun kvm -i -M 256 -I if,vioif,'-net tap,ifname=tap0,script=/etc/qemu-ifup' -W if,inet,static,192.168.42.23/24 -- ~/udpping.bin
