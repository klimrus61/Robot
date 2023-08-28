#!/bin/python3

import logging

import rospy
from std_msgs.msg import String


logger = logging.getLogger("logger")
logging.basicConfig(filename="message.log",
                    format='%(asctime)s: %(levelname)s: %(message)s',
                    level=logging.INFO)


def callback(data):
    logger.info(data)
    rospy.loginfo(rospy.get_caller_id() + 'I heard %s', data)
    

def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber('chatter', String, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()