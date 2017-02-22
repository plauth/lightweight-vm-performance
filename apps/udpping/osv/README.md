Prerequisites
=============
The OSv toolchain has to be installed. For instructions, please refer to https://github.com/cloudius-systems/osv.
 

Setup
=====
In the `osv/apps` folder, please create a new folder called `udpping`. Copy the files `Capstanfile`, `GET`, `Makefile`, and `module.py` to the newly created folder. Afterwards, `cd` back to the base `osv` folder and execute the following command:

```sh
scripts/build -nv -e image=udpping
```

Start (KVM)
===========
To manually start an instance, use this command:
```sh
scripts/run.py -nv -m 128M -c 1 -e "--ip=eth0,[IP_OF_OSV_INSTANCE],255.255.255.0 --defaultgw=[GATEWAY_IP] --nameserver=[DNS_IP] `cat build/release/cmdline`"
```
To perform actual measurements, please launch the `timer_osv.py` script, which also takes care of the instantiation through calling `launch_udpping.sh`. The OSv instance automatically terminates afterwards.


Benchmark
=========
Please run the script `timer_osv.py` to perform startup time measurements.