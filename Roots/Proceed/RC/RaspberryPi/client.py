import RPi.GPIO as GPIO
import time
import socket

TCP_IP = '129.2.200.255' # server ip
TCP_PORT = 5005
TRIG = 18
ECHO = 23
 
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((TCP_IP, TCP_PORT))
init_distance()

while 1:
    s.send(str(distance()).encode())
    time.sleep(0.5)
    
s.close() 
GPIO.cleanup()


def init_distance():
	GPIO.setmode(GPIO.BCM)
	GPIO.setup(TRIG, GPIO.OUT)
	GPIO.setup(ECHO, GPIO.IN)

	GPIO.output(TRIG, False)
	time.sleep(2)


def distance():
	GPIO.output(TRIG, True)
	time.sleep(0.00001)
	GPIO.output(TRIG, False)
	pulse_start = time.time()

	while GPIO.input(ECHO)==0:
	    pulse_start = time.time()
	    
	while GPIO.input(ECHO)==1:
	    pulse_end = time.time()
	    
	pulse_duration =  pulse_end - pulse_start

	# print("Distance:", distance, "cm")
	# distance = round(pulse_duration * 17150, 2)
	distance = pulse_duration * 17150

	return distance