# Container platform

### Docker Swarm set up 

Copy, paste, and execute the contents of `install-docker.sh` in your Linux terminal.

(optional step) Copy, paste, and execute the contents of `install-docker-ctop.sh` in your Linux terminal.

Open `init-swarm.sh` and change VM_IP variable to your VM's IP. Exemple:
    VM_IP= #PUT YOUR VM IP HERE
    VM_IP=127.0.255.250

Copy, paste, and execute the contents of `init-swarm.sh` in your Linux terminal.

Your docker swarm network will be `network_swarm_public`

You may want to copy the command to add workers if the future. It should show the command `docker swarm join --token`, a token, and the VM' IP, just like this exmeple:
    
    To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-*mockup token* 127.0.255.250


If you need to add managers and workers, please follow the instructions in `join-swarm.md`.


### Reference:
-https://docs.docker.com/engine/install/debian/
-https://docs.docker.com/engine/swarm/admin_guide/
-https://docs.docker.com/engine/swarm/swarm-mode/