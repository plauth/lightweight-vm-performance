Prerequisites
=============
An Ubuntu-Linux based virtual machine has to be created and the `udpping` application has to be setup up (see generic folder).

Setup
=====
```sh
docker build -t "udpping"
```

Benchmark
=========
* For KVM-based virtual machines, please use the `timer_ubuntu_kvm.py` benchmark script. The VM has to be named `ubuntu-kvm`.
* For Xen-based virtual machines, please use the `timer_ubuntu_xen.py` benchmark script. The VM has to be named `ubuntu-xen`.