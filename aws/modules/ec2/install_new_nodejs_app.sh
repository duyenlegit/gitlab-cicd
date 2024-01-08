#!/bin/bash
sudo apt-get update -y

# Install Docker
curl -fsSL https://get.docker.com | sudo sh

# Add the current user to the Docker group (only needed if you want to run Docker commands without sudo)
sudo usermod -aG docker ubuntu 
newgrp docker
# this only takes effect in a new shell settion

git clone -b feature2 --single-branch https://gitlab.com/smartosc3/roadmap.git /home/ubuntu/roadmap

cd /home/ubuntu/roadmap/app

sudo docker build -t app .

# Run the Docker container
sudo docker run -dp 3000:3000 app