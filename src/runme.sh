#!/bin/bash

source /opt/ros/noetic/setup.bash
source /home/resume_project/devel/setup.bash
pwd

roscore &
sleep 2
source devel/setup.bash
rosrun logger logger.py &
sleep 2
source venv/bin/activate
python3 ./src/resume_pkg/scripts/publisher_node.py &



# Wait for any process to exit
wait -n

exit $?
