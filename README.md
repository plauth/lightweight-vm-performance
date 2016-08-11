# lightweight-vm-performance

Startup time measurement
========================

launch udpping on rumprun on xen:
```
rumprun xen -M 1024 -i -I net1,xenif,script=vif-bridge,bridge=xenbr0,mac=00:16:3e:29:2b:7d -W net1,inet,dhcp — udpping.bin
```

launch udpping on rumprun on kvm:
```
rumprun kvm -M 1024 -I if,vioif,'-net tap,ifname=tap0,script=/etc/qemu-ifup' -W if,inet,dhcp -- /home/max.plauth/udpping.bin
```

build udpping for mirage on xen:
```
cd udpping/mirage
mirage configure -t xen --dhcp=true --network=0
```


Application performance
=======================

Nginx
-----
launch nginx on rumprun on xen:
```
rumprun xen -M 1024 -i -I net1,xenif,script=vif-bridge,bridge=xenbr0,mac=00:16:3e:29:2b:7d -W net1,inet,dhcp -e RUMPRUN_SYSPROXY=tcp://0:12345 -b images/data.iso,/data -- ./nginx.bin -c /data/conf/nginx.conf
```

launch nginx on rumprun on kvm:
```
rumprun kvm -M 128 -I if,vioif,'-net tap,ifname=tap0,script=/etc/qemu-ifup' -W if,inet,dhcp -e RUMPRUN_SYSPROXY=tcp://0:12345 -b images/data.iso,/data -- ./nginx.bin -c /data/conf/nginx.conf
```

Redis
-----
todo