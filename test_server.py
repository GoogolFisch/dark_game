import socket

s = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
s.bind(("127.0.0.1","25600"))
try:
    s.listen(1)
    s.accept()
    print(s.recv(64))
    s.send(b"hello from server!")
except Exception as e:
    print(e)

s.close()