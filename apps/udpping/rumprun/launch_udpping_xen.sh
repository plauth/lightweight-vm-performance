#!/bin/sh
/opt/rumprun/rumprun/bin/rumprun xen -M 192 -I net1,xenif,script=vif-bridge,bridge=xenbr0 -W net1,inet,static,[IP_OF_RUMPRUN_INSTANCE]/24,[GATEWAY_IP] -- ~/udpping.bin
