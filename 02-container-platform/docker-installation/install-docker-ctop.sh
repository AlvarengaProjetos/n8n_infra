#!/bin/bash

# Docker ctop Installation Script

set -e

echo "📊 Installing docker-ctop (container monitoring)..."

# Install dependencies
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Add Azlux repository
curl -fsSL https://azlux.fr/repo.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/azlux-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian \
  $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/azlux.list >/dev/null

# Install docker-ctop
sudo apt-get update
sudo apt-get install -y docker-ctop

echo "✅ docker-ctop installed successfully"
echo "🚀 Run: docker-ctop to monitor containers"