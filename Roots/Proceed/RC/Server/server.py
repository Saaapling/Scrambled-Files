import socket
import serial
import sys
import time

TCP_IP = '10.104.148.103' # private ip
TCP_PORT = 5005

a = serial.Serial('\\.\COM8', 115200)

def move(data):
	if data < 20:
		a.write(chr(0).encode())		
	else:
		a.write(chr(1).encode())

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((TCP_IP, TCP_PORT))
s.listen(1)

conn, addr = s.accept()
print('Connection address: ', addr)

while 1:
    data = float(conn.recv(1024).decode())
    move(data)
    print("received data:", data)
    sys.stdout.flush()
conn.close()
