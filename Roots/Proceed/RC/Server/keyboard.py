import keyboard
import serial
import time

while True:
    if keyboard.is_pressed('w'):  # forward
        a.write(chr(1).encode())    
    elif keyboard.is_pressed('a'): # backward
        a.write(chr(2).encode())    
    elif keyboard.is_pressed('s'): # right
        a.write(chr(3).encode())    
    elif keyboard.is_pressed('d'): # left
        a.write(chr(4).encode())    
    elif keyboard.is_pressed('q'):
        break
    else:
        continue
    t
