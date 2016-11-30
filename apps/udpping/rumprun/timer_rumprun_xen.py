import socket
import time
import subprocess
import threading


def netcat():
    s = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
    s.bind(('0.0.0.0',1337))
    start = time.time()
    data,addr = s.recvfrom(1)
    end = time.time() - start
    print ("It took %f seconds to bring up the image!" % end)
    
def process():
    cmd = subprocess.Popen(['~/launch_udpping_xen.sh'], shell=True, stdout=subprocess.PIPE)
    while True:
        line = cmd.stdout.readline()
        if 'xen' in line:
            vmid = int(line.rstrip().split(':')[1])
            time.sleep(5)
            subprocess.call(['xl', 'destroy', str(vmid)])
        else:
            break        

nc = threading.Thread(name='netcat', target=netcat)
p = threading.Thread(name='process', target=process)

nc.start()
p.start()

