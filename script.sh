#!/bin/bash

echo "Updating package manager"
apt update

echo "Installing Docker"
apt -y install docker.io

echo "Enabling Docker to start automatically"
systemctl enable docker
systemctl start docker

echo "Verifying Docker version"
docker --version

echo "Installing Docker Compose"
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

echo "Running Docker Compose"
chmod +x /usr/local/bin/docker-compose

echo "Verifying Docker Compose version"
docker-compose --version

echo "Run with Docker"
docker-compose up -d