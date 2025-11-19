# Configurations for Kong

### Edit the limits configuration file
nano /etc/security/limits.conf

### Add these lines at the end:
* soft nofile 4096
* hard nofile 65536
root soft nofile 4096
root hard nofile 65536