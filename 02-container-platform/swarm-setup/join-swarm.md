# Docker Swarm Join Script
### Script to join nodes to an existing Swarm cluster as a manager or worker
Get the manager join token
<pre>bash docker swarm join-token manager</pre>

### Generate the command to add worker
In your manager1 execute:
<pre>docker swarm join-token worker</pre>

It should return something like:

`docker swarm join --token SWMTKN-*mockup token* 127.0.255.25`
Copy and paste it into the VM you're trying to add as worker.

### Generate the command to add manager
In your manager1 execute:
<pre>docker swarm join-token manager</pre>

It should return something like:

`docker swarm join --token SWMTKN-*mockup token* 127.0.255.25`
Copy and paste it into the VM you're trying to add as manager.

### How to add a worker:
Ensure that you have installed the same version of Linux on your manager1 VM, and that Docker is also installed on the VM you want to add to your swarm.

Generate the command to add worker at your manager1.

Copy and paste the `docker swarm join --token SWMTKN-*mockup token* 127.0.255.25` command in the VM you want to add as worker.

### How to add a manager:
Again, ensure that you have installed the same version of Linux on your manager1 VM, and that Docker is also installed on the VM you want to add to your swarm.

There is two ways of adding managers, directly adding a manager or adding a worker and promoting it to manager.

### Directly adding a manager
Generate the command to add manager at your manager1.

Copy and paste it in the VM you want to add as manager.

Copy and paste the `docker swarm join --token SWMTKN-*mockup token* 127.0.255.25` command in the VM you want to add as manager.

### Promoting a worker to manager
After adding the node as a worker, promote it to a manager. I recommend using the standard naming convention: manager1, manager2, manager3, etc.

<pre>bash docker node ls</pre>
<pre>bash docker node promote *worker-node-id*</pre>

### Important notes:
You should have at least 1 manager, ideally 3, 5, or 7 for high availability. With 3 managers, you get fault tolerance for 1 node, meaning one VM can go down and the swarm will still function. 
Having too many managers can negatively impact swarm performance.

### Reference:
https://docs.docker.com/engine/swarm/join-nodes/
https://docs.docker.com/engine/swarm/admin_guide/
