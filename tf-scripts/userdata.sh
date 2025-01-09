#!/bin/bash 
#
# Author : Anil Kumar Mamidi
# Description : This script is used to install docker, docker-compose and nginx on the EC2 instance
# Version : v1.0

# Update the packages & install docker and nginx
yum update -y
yum install -y docker nginx

# Start and enable the docker and nginx services
systemctl start docker
systemctl enable docker

# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Start and enable the nginx service
systemctl start nginx
systemctl enable nginx