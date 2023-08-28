#!/bin/python3

import logging
from pydantic import BaseModel

import rospy
from std_msgs.msg import String


logger = logging.getLogger("logger")
logging.basicConfig(filename="message.log",
                    format='%(asctime)s: %(levelname)s: %(message)s',
                    level=logging.CRITICAL)


class LogItem(BaseModel):
    log: str


def callback(data: LogItem):
    rospy.loginfo(rospy.get_caller_id() + 'I heard %s', data)
    logger.info(data)

def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber('chatter', String, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()