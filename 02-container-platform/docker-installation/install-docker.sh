#!/bin/bash

# Docker Installation Script
# Complete Docker CE installation for Debian-based systems

set -e

echo "🐳 Installing Docker Engine..."

# Update system and install dependencies
apt-get update
apt install -y sudo gnupg2 wget ca-certificates apt-transport-https curl gnupg nano htop

# Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository
echo \
  "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  \"$(. /etc/os-release && echo \"$VERSION_CODENAME\")\" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Enable Docker to start on boot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Start Docker service
sudo systemctl start docker

# Verify installation
echo "✅ Docker installed successfully"
docker --version
docker compose version