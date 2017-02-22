#!/bin/bash
/opt/osv/scripts/run.py -nv -m 128M -c 1 -e "--ip=eth0,[IP_OF_OSV_INSTANCE],255.255.255.0 --defaultgw=[GATEWAY_IP] --nameserver=[DNS_IP] `cat build/release/cmdline`"
