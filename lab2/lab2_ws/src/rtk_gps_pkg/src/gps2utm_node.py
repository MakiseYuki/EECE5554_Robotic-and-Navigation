#!/usr/bin/env python
# license removed for brevity

import rospy
import utm
from sensor_msgs.msg import NavSatFix
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Point

# Define pub pusblish to the rostopic utm_fix
pub = rospy.Publisher('utm_fix', Odometry, queue_size=100000)

def callback(navs):
    
    rospy.loginfo("Longitude: %f, Latitude %f, Altitude %f" % (navs.longitude, navs.latitude, navs.altitude))

    utmpub = Odometry()
    utmconvert = utm.from_latlon(navs.latitude, navs.longitude)

    # Structure Pont save utm x,y,z
    sav = Point()
    sav.x = utmconvert[0]
    sav.y = utmconvert[1]
    sav.z = navs.altitude

    utmpub.pose.pose.position = sav
    # publish Pont message to utm_fix
    pub.publish(utmpub)
    

def gps2utm_node():
    
    rospy.init_node('rtk_gps_node', anonymous=True)  
    rate = rospy.Rate(100) # 100Hz > 75Hz  
    # Subscribe from the topic rtk_fix
    sub = rospy.Subscriber("rtk_fix", NavSatFix, callback)

    rospy.spin()

if __name__ == '__main__':
    try:
        gps2utm_node()
    except rospy.ROSInterruptException:
        pass
