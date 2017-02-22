#!/bin/sh
/opt/rumprun/rumprun/bin/rumprun kvm -M 192 -I if,vioif,'-net tap,ifname=tap0,script=/etc/qemu-ifup' -W if,inet,static,[IP_OF_RUMPRUN_INSTANCE]/24,[GATEWAY_IP] -- ~/udpping.bin