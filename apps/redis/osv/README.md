Prerequisites
=============
The OSv toolchain has to be installed. For instructions, please refer to https://github.com/cloudius-systems/osv.

In order to apply tuned network stack settings, please modify the following values right after cloning the `osv` repository and before proceeding with any further installation steps from the link above:

| Path                             | Parameter             | Value   |
| -------------------------------- | --------------------- | ------- |
| ./include/osv/file.h             | FDMAX                 | 0x30D40 |
| ./libc/libc.cc                   | RLIMIT_NOFILE         | 200000  |
| ./bsd/sys/netinet/in.h           | IPPORT_EPHEMERALFIRST | 1024    |
| ./bsd/sys/netinet/in.h           | IPPORT_EPHEMERALLAST  | 65535   |
| ./bsd/sys/netinet/in.h           | IPPORT_HIFIRSTAUTO    | 1024    |
| ./bsd/sys/netinet/in.h           | IPPORT_HILASTAUTO     | 65535   |
| ./bsd/sys/netinet/tcp\_timer.h   | TCPTV_KEEP_INIT       | 60*hz   |
| ./bsd/sys/netinet/tcp\_timer.h   | TCPTV_KEEPINTV        | 60*hz   |
| ./bsd/sys/sys/socket.h           | SOMAXCONN             | 1024    |    
| ./include/api/sys/socket.h       | SOMAXCONN             | 1024    |     
 

Setup
=====
Make sure you are in the base `osv` directory. Download `apps/redis/generic/redis_custom.conf` file and move it to `./apps/redis-memonly`. From the base `osv` directory, execute the following command:

```sh
scripts/build -nv -e image=redis-memonly
```

Start (KVM)
===========
To start an instance, use the command:
```sh
scripts/run.py -nv -m 384M -c 1 -e "--ip=eth0,[IP_OF_OSV_INSTANCE],255.255.255.0 --defaultgw=[GATEWAY_IP] --nameserver=[DNS_IP] /redis-server redis_custom.conf"
```

Stop (KVM)
==========
Retrieve ID of the `osv` instance using `virsh list`. Destroy instance by issuing `virsh destroy [ID_OF_OSV_INSTANCE]`.


Benchmark
=========
```sh
redis-benchmark -h [IP_OF_OSV_INSTANCE] -c [1-1000] -n 100000 -k 1 -t set,get
```