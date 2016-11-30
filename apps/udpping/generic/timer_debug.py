import socket
import time
import subprocess
import threading


s = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
s.bind(('0.0.0.0',1337))
start = time.time()
data,addr = s.recvfrom(1)
end = time.time() - start
print ("It took %f seconds to bring up the image!" % end)