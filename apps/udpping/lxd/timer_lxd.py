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
    time.sleep(5)
    subprocess.call(['lxc', 'stop', 'udpping'])
    subprocess.call(['lxc', 'delete', 'udpping'])
    time.sleep(5)    

def process():
    subprocess.call(['lxc','launch','udpping','udpping'])

nc = threading.Thread(name='netcat', target=netcat)
p = threading.Thread(name='process', target=process)

nc.start()
p.start()

