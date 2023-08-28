FROM ros:noetic-ros-base

RUN sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN sudo apt-get update && \
    sudo apt-get install curl && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

RUN sudo apt update && \
    sudo apt install ros-noetic-ros-base

SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN source ~/.bashrc

WORKDIR /home/resume_project
COPY . /home/resume_project/

RUN apt-get update \
    && apt-get install --assume-yes --no-install-recommends --quiet \
        software-properties-common \
    && apt-get install --assume-yes --no-install-recommends --quiet \
    python3 \
    python3-pip \
    python3-venv \
    && apt-get clean all

RUN python3 -m venv venv
RUN source venv/bin/activate
RUN pip3 install --upgrade pip
RUN pip3 install roslibpy rospkg fastapi pydantic uvicorn 
RUN chmod +x ./src/runme.sh
RUN source devel/setup.bash

EXPOSE 8005
CMD source ./src/runme.sh