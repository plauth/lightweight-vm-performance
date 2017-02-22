Prerequisites
=============
Please follow the instructions on https://mirage.io/wiki/install.

Setup
=====
Clone the repository `git://github.com/mirage/mirage-skeleton.git` and create a subfolder udpping. Copy all .ml files (config.ml, unikernel.ml) to the newly created udpping folder and `cd` to the folder.

There, run the following commands:
```sh
mirage configure -t xen --ip=[IP_OF_RUMPRUN_INSTANCE] --gateways=[GATEWAY_IP] --netmask=255.255.255.0 --network=0
make
```

Benchmark
=========
see `timer_mirage.py`