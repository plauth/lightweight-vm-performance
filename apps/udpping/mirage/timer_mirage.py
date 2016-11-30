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
    
def process():
    subprocess.call(['xl', 'create', '~/mirage-skeleton/udpping/udpping.xl'])

nc = threading.Thread(name='netcat', target=netcat)
p = threading.Thread(name='process', target=process)

nc.start()
p.start()

