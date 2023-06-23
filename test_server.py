import socket
import traceback
import sys

"""
with socket.socket(socket.AF_INET,socket.SOCK_DGRAM) as s:
    s.bind(("127.0.0.1",12700))
    s.listen()
    conn,addr = s.accept()
    with conn:
        print(f"Connected by {addr}")
        data = conn.recv(64)
        print(data)
        conn.sendall(b"hello from server!")
"""
PORT = 9999
def call_server():
    with socket.socket(socket.AF_INET,socket.SOCK_DGRAM)as c_s:
        c_s.settimeout(0.5)
        m = b"h"
        addr = ("127.0.0.1",PORT)
        c_s.sendto(m,addr)
        print(c_s.recvfrom(64))

def server():
    s = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
    s.bind(("",PORT))

    try:
        message,address = s.recvfrom(64)
        print(message)
        print(address)
        s.sendto(b"hello from server!",address)
    except Exception as e:
        print(e)
        exc_type, exc_value, exc_traceback = sys.exc_info()
        traceback.print_exc()

    try:s.close()
    except Exception as e:
        print(f"closeing:{e}")

if __name__ == "__main__" and len(sys.argv) < 2:server()