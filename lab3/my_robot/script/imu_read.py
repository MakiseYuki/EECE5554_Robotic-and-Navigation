#!/usr/bin/env python
import serial
import lcm
import time
import sys
import numpy as np
from lab3gps_imu import imu_t

#if __name__ == '__main__':
	#if len(sys.argy) !=2:
		#print 'Usage: %s <serial_port>\n' % sys.argv[0]
		#sys.exit(0)

ser = serial.Serial('/dev/ttyUSB0',115200,timeout=1)
#imudata=serial.Serial(sys.argv[1],115200,timeout=1)

lc = lcm.LCM()
#if using multicast to communivate lcm over a network use below code...



#lc = lcm.LCM("udpm://224.0.0.0:8080?ttl=1")

imu = imu_t()
while True:
    
    mydat = ser.readline()
    mydat_string=np.array(mydat.split(','))
    print(mydat)
    if mydat_string[0]=='$VNYMR' :
        mydat_string[mydat_string=='']='0'
	
	
	#print mydat_string
    	imu.yaw    	=float(mydat_string[1])
	imu.pitch	=float(mydat_string[2])
	imu.roll 	=float(mydat_string[3])
	imu.mag_x	=float(mydat_string[4])
	imu.mag_y	=float(mydat_string[5])
	imu.mag_z	=float(mydat_string[6])
	imu.acc_x	=float(mydat_string[7])
	imu.acc_y	=float(mydat_string[8])
	imu.acc_z	=float(mydat_string[9])
	imu.gyro_x_radps=float(mydat_string[10])
	imu.gyro_y_radps=float(mydat_string[11])
        imu12		=mydat_string[12]	
	imuseparate	=np.array(imu12.split('*'))
	imu.gyro_z_radps=float(imuseparate[0])

	
	lc.publish("imu", imu.encode())
pass
