import RPi.GPIO as GPIO
from time import sleep
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(14, GPIO.IN, GPIO.PUD_DOWN)
def my_callback(channel):
        if GPIO.input(14):
                print"rising edge detected"
                exit()
        else:
                my_callback(channel)
GPIO.add_event_detect(14, GPIO.RISING, callback=my_callback)
try:
        sleep(30)
finally:
        GPIO.cleanup()
exit()
