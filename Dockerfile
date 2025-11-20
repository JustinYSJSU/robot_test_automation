# Start from an official ROS 2 Humble base image
FROM osrf/ros:humble-desktop-full

# Set environment variables for non-interactive install
ENV DEBIAN_FRONTEND=noninteractive

# Install TurtleBot3 simulation packages
RUN apt update && \
    apt install -y \
    ros-humble-gazebo-ros-pkgs \
    ros-humble-turtlebot3-msgs \
    ros-humble-turtlebot3 \
    ros-humble-turtlebot3-gazebo && \
    rm -rf /var/lib/apt/lists/*

# Install Python and pytest dependencies
RUN apt update && \
    apt install -y python3-pip python-is-python3 && \
    pip install pytest pytest-html

# Set the TurtleBot3 model (Burger)
ENV TURTLEBOT3_MODEL=burger

# Set the entrypoint to source the ROS 2 environment
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]