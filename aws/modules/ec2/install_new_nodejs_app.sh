#!/bin/bash
sudo apt-get update -y

# Install Docker
curl -fsSL https://get.docker.com | sudo sh

# Add the current user to the Docker group (only needed if you want to run Docker commands without sudo)
sudo usermod -aG docker ubuntu 
newgrp docker

git clone -b feature1 --single-branch https://gitlab.com/smartosc3/roadmap.git /home/ubuntu/roadmap

if [ -d "/home/ubuntu/myapp" ]; then
    cd /home/ubuntu/myapp
else
    echo "/home/ubuntu/myapp does not exist"
    exit 1
fi
sudo docker build -t roadmap .

# Run the Docker container
sudo docker run -dp 3000:3000 roadmap