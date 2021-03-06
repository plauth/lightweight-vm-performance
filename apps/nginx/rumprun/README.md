Prerequisites
=============
Rumprun toolchain has to be installed. For instructions, please refer to https://github.com/rumpkernel/wiki/wiki/Tutorial:-Building-Rumprun-Unikernels.

In order to apply tuned network stack settings, please modify the following values right after cloning the `rumprun` repository and before proceeding with any further installation steps:

| Path                         | Parameter         | Value        |
| ---------------------------- | ----------------- | ------------ |
| ./sys/conf/param.c           | MAXFILES          | 200000       |
| ./sys/netinet/in.h           | IPPORT\_ANONMIN   | 1024         |
| ./sys/netinet/in.h           | IPPORT\_ANONMAX   | 65535        |
| ./sys/netinet/tcp\_timer.h   | TCPTV\_KEEP\_INIT | 30*PR_SLOWHZ |
| ./sys/netinet/tcp\_timer.h   | TCPTV\_KEEPINTV   | 30*PR_SLOWHZ |
| ./sys/sys/socket.h           | SOMAXCONN         | 1024         |    

 

Setup
=====
Please `cd` to the `apps/rumprun-packages/nginx` directory. Download `apps/nginx/rumprun/nginx.conf` file and move it into the folder `./images/data/conf`. Download a favicon (e.g. http://www.hpi.de/favicon.ico) and move it to the folder `./images/data/www`. Afterwards, please follow the instructions of the `README.md` found in `apps/rumprun-packages/nginx`.

Start (KVM)
===========
```sh
rumprun kvm -M 192 -I if,vioif,'-net tap,ifname=tap0,script=/etc/qemu-ifup' -W if,inet,static,[IP_OF_RUMPRUN_INSTANCE]/24,[GATEWAY_IP] -e RUMPRUN_SYSPROXY=tcp://0:12345 -b images/data.iso,/data -- ./nginx.bin -c /data/conf/nginx.conf
```

Stop (KVM)
==========
Retrieve ID of `rumprun` instance using `virsh list`. Destroy instance by issuing `virsh destroy [ID_OF_RUMPRUN_INSTANCE]`.


Start (Xen)
===========
```sh
rumprun xen -M 192 -i -I net1,xenif,script=vif-bridge,bridge=xenbr0 -W net1,inet,static,[IP_OF_RUMPRUN_INSTANCE]/24,[GATEWAY_IP] -e RUMPRUN_SYSPROXY=tcp://0:12345 -b images/data.iso,/data -- ./nginx.bin -c /data/conf/nginx.conf
```
Stop (Xen)
==========
Retrieve ID of `rumprun` instance using `xl list`. Destroy instance by issuing `xl destroy [ID_OF_RUMPRUN_INSTANCE]`.


Additional Configuration
========================
```sh
export RUMP_SERVER=tcp://[IP_OF_RUMPRUN_INSTANCE]:12345
. rumpctrl/rumpctrl.sh
sysctl -w proc.0.rlimit.descriptors.soft=200000
sysctl -w proc.0.rlimit.descriptors.hard=200000
sysctl -w proc.1.rlimit.descriptors.soft=200000
sysctl -w proc.1.rlimit.descriptors.hard=200000
sysctl -w proc.2.rlimit.descriptors.hard=200000
sysctl -w proc.2.rlimit.descriptors.soft=200000
rumpctrl_unload
```

Benchmark
=========
```sh
gcc -O2 ../generic/ab.c -o abc -lpthread
./abc [0-1k:100kA+100x30] [IP_OF_RUMPRUN_INSTANCE]/favicon.ico
```