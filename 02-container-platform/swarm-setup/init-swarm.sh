
### Initialization Script: `init-swarm.sh` ###

# Docker Swarm Initialization Script
# Initializes Swarm cluster and creates overlay network

set -e

echo "🐝 Initializing Docker Swarm Cluster, Please type your Virtual Machine IP:"

VM_IP=$1

if [[ ! $VM_IP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "❌ Error: Invalid IP address format"
    exit 1
fi

echo "🔧 Initializing Swarm with advertise-addr: $VM_IP"

# Initialize Docker Swarm
docker swarm init --advertise-addr=$VM_IP

# Create overlay network for services
echo "🌐 Creating overlay network..."
docker network create --driver=overlay --attachable network_swarm_public

echo "✅ Docker Swarm initialized successfully!"
echo "📊 Current node status:"
docker node ls