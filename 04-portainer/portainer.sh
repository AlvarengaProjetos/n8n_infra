#!/bin/bash

# Pull the Portainer Community Edition Docker image with the 'sts' tag (stable version)
docker pull portainer/portainer-ce:sts

# Deploy the Docker stack using the 'portainer.yaml' compose file
# --prune: removes services that are no longer defined in the compose file
# --detach=false: run the deploy command in the foreground (waits for completion)
# --resolve-image always: always pull the image before deploying
docker stack deploy --prune --detach=false --resolve-image always -c portainer.yaml portainer

# If you lost the first 5 minutes during the initial Portainer admin user creation,
# you can force the Portainer service to restart to reset the process:
docker service update --force portainer_portainer
