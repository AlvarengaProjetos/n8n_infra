# Docker Swarm Join Script
### Script to join nodes to an existing Swarm cluster as a manager or worker
Get the manager join token
<pre>bash docker swarm join-token manager</pre>

### How to add a worker:
Install Docker on the new VM that you want to add to the swarm.

Run the following command on the new VM, replacing *your-token* with the actual token and <manager-ip> with your manager node's IP address. You should already have this information from the command `docker swarm init --advertise-addr=$VM_IP` in the `init-swarm.sh` script.:

<pre>bash docker swarm join --token *your-token*</pre>

### How to add a manager:
After adding the node as a worker, promote it to manager:

<pre>bash docker node ls</pre>
<pre>bash docker node promote *worker-node-id*</pre>

### Important notes:
You should have at least 1 manager, ideally 3, 5, or 7 for high availability. With 3 managers, you get fault tolerance for 1 node, meaning one VM can go down and the swarm will still function. 
Having too many managers can negatively impact swarm performance.

### Reference:
https://docs.docker.com/engine/swarm/admin_guide/
