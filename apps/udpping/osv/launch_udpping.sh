#!/bin/bash
cd /opt/osv
scripts/run.py -nv -m 128M -c 1 -e "--ip=eth0,192.168.42.23,255.255.255.0 --defaultgw=192.168.42.1 --nameserver=192.168.42.2 `cat build/release/cmdline`"
