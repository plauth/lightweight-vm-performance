#!/bin/sh
/opt/rumprun/rumprun/bin/rumprun xen -M 256 -I net1,xenif,script=vif-bridge,bridge=xenbr0 -W net1,inet,static,192.168.42.23/24,192.168.42.1 -- ~/udpping.bin
