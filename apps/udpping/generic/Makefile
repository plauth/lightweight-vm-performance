CC_RR=x86_64-rumprun-netbsd-gcc
RR_BAKE=rumprun-bake
SERVER=192.168.42.42

main: udpping.c
	$(CC) -DSERVER=\"$(SERVER)\" udpping.c -o udpping
	
service: main
	mv udpping /opt/
	cp udpping.service /etc/systemd/system/
	systemctl enable udpping.service 

rumprun: udpping.c
	$(CC_RR) udpping.c -o udpping

rumprun_xen: rumprun
	$(RR_BAKE) xen_pv udpping.bin udpping
	rm udpping

rumprun_kvm: rumprun
	$(RR_BAKE) hw_virtio udpping.bin udpping
	rm udpping

clean:
	rm -f udpping
	rm -f udpping.bin
