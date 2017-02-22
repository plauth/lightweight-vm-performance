Prerequisites
=============
Rumprun toolchain has to be installed. For instructions, please refer to https://github.com/rumpkernel/wiki/wiki/Tutorial:-Building-Rumprun-Unikernels.
 

Setup
=====
Please use the `Makefile` in the generic folder. For KVM, please run `make rumprun_kvm` and for Xen, please run `make rumprun_xen`.

Start (KVM)
===========
To manually start an instance, use this command:
```sh
rumprun kvm -M 192 -I if,vioif,'-net tap,ifname=tap0,script=/etc/qemu-ifup' -W if,inet,static,[IP_OF_RUMPRUN_INSTANCE]/24,[GATEWAY_IP] -- udpping.bin
```
To perform actual measurements, please launch the `timer_rumprun_kvm.py` script, which also takes care of the instantiation through calling `launch_udpping_kvm.sh`. The script also terminates the instance after the measurements have been completed.

Stop (KVM)
==========
Retrieve ID of `rumprun` instance using `virsh list`. Destroy instance by issuing `virsh destroy [ID_OF_RUMPRUN_INSTANCE]`.


Start (Xen)
===========
To manually start an instance, use this command:
```sh
rumprun xen -M 192 -I net1,xenif,script=vif-bridge,bridge=xenbr0 -W net1,inet,static,[IP_OF_RUMPRUN_INSTANCE]/24,[GATEWAY_IP] —- udpping.bin
```
To perform actual measurements, please launch the `timer_rumprun_xen.py` script, which also takes care of the instantiation through calling `launch_udpping_xen.sh`. The script also terminates the instance after the measurements have been completed.

Stop (Xen)
==========
Retrieve ID of `rumprun` instance using `xl list`. Destroy instance by issuing `xl destroy [ID_OF_RUMPRUN_INSTANCE]`.


Benchmark
=========
Depending on the employed hypervisor, please run `timer_rumprun_kvm.py` or `timer_rumprun_xen.py`.