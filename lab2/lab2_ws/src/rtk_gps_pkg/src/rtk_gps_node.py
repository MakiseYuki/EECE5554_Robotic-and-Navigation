#!/usr/bin/env python
# license removed for brevity

import rospy
import serial
from sensor_msgs.msg import NavSatFix
from std_msgs.msg import Header


def rtk_gps_node():
	# queue sine set up to large avoid message lost from buffer
	# define pub publish to rtk_fix rostopic
    pub = rospy.Publisher('rtk_fix', NavSatFix, queue_size=100000) 
    rospy.init_node('rtk_gps_node', anonymous=True)
	# 100hz for more serial message to PC
    rate = rospy.Rate(100) 
	# getting serial message from /dev/ttyACM0 baud rate as 115200
    ser = serial.Serial('/dev/ttyACM0','115200')
    navs = NavSatFix()
    header = Header()
    while not rospy.is_shutdown():
	readinstring = ser.readline()
	oristr = readinstring.split(',')
	# when the serial message title as GNGGA, stor in navs(NavaSatFix) structure
	if oristr[0] == "$GNGGA":
		
		if oristr[3] == 'N':
			navs.latitude = float(float(oristr[2])/100) + float(float(oristr[2])%100)/60
		elif oristr[3] == 'S':
			navs.latitude = -(float(float(oristr[2])/100) + float(float(oristr[2])%100)/60)
		if oristr[5] == 'E':
			navs.longitude = float(float(oristr[4])/100) + float(float(oristr[4])%100)/60
		elif oristr[5] == 'W':
			navs.longitude = -(float(float(oristr[4])/100) + float(float(oristr[4])%100)/60)
		navs.altitude = float(oristr[9])
		#publish navs to rtk_fix
		pub.publish(navs)        
		print(readinstring)
	
        rate.sleep()

if __name__ == '__main__':
    try:
        rtk_gps_node()
    except rospy.ROSInterruptException:
        pass
