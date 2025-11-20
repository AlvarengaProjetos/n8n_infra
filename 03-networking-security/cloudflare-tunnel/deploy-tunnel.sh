#!/bin/bash
# This script pulls the latest Cloudflared image and deploys it using Docker Swarm stack.

# Pull the latest version of the Cloudflared image from Docker Hub
docker pull cloudflare/cloudflared:latest

# Deploy the Cloudflared stack using the cloudflared.yaml file
# prune: removes services that are no longer referenced in the compose file
# detach=false: runs in the foreground so you can see the output
# resolve-image always: ensures the image is pulled and updated if needed
# -c cloudflared.yaml: specifies the Compose file to use
# cloudflared: the name of the stack
docker stack deploy --prune --detach=false --resolve-image always -c docker-compose.cloudflared.yaml cloudflared
