# Networking security
We can use a common solution like Traefik combined with a paid load balancer to manage reverse proxy and network-related issues. I'll leave the Traefik labels in the service stacks if you want to use them, but I won’t be covering any load balancer setup for Traefik at this time. Instead, I'll walk you through the Cloudflare solution for handling both reverse proxy and load balancing. This budget-friendly option is a good fit for small projects, despite its downsides.

## Cloudflare Tunnel
### Why Cloudflare Tunnel over a reverse proxy + load balancer?
- First, Cloudflare Tunnel is an efficient solution because it has built-in load balancing capabilities. This distributes traffic effectively across multiple servers or services, providing the benefits of load balancing and high availability without the overhead of a dedicated one.
- Additionally, using cloudflared is a simple alternative that eliminates the need to set up and manage a complex infrastructure. This is ideal when you don't require granular traffic control.
- Its seamless integration with containerized environments is another key advantage. Since services in these environments scale dynamically, Cloudflare Tunnel automatically handles routing and security, unlike a traditional load balancer that requires additional configuration.
- Finally, by exposing applications through Cloudflare Tunnel, they gain the full benefits of Cloudflare's DNS, CDN, and DDoS services, as well as its WAF, API, and bot services—all without exposing the application servers directly to the internet.

### Downsides
- Downtime will occur. On November 18, 2025, we experienced a 6-hour outage: 
https://blog.cloudflare.com/18-november-2025-outage/
So, if you choose Cloudflare, you’ll be at the mercy of their infrastructure.
- Reduced control over network management and load balancing. With Cloudflare Tunnel, you rely on their systems, which may limit customization and flexibility.

### Cloudflare token
In docker-compose.cloudflared.yaml there is a token you must put. After creted the first tunnel on cloudflare.com there will be at the tunnel tab "install and execure connector" and a box like:

<pre>cloudflared.exe service install *YOUR_TOKEN_HERE*</pre>

Copy and paste this token into docker-compose.cloudflared.yaml

### Install Cloudflared
In your manager1 terminal execute
```bash nano docker-compose.cloudflared.yaml``` 

Copy and paste `deploy-tunnel.sh` content into manager1 terminal, save and exit.

Copy, paste and execute deploy-tunnel.sh content into manager1 terminal.

Execute the following command into manager1 terminal to check if there is a cloudflared service running.
```bash docker ps```

In the Cloudflare dashboard, navigate to Zero Trust > Networks > Connectors, and ensure that your tunnel status is marked as HEALTHY.

## Firewall
All ports must say closed. We open only 443 and 80 for web traffic only. We open port 22 to maintenance purpose only.


## Kong
Work in progress...


### Reference
-https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/configure-tunnels/tunnel-availability/
-https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/configure-tunnels/tunnel-availability/
-https://hub.docker.com/r/cloudflare/cloudflared
-https://developers.cloudflare.com/reference-architecture/architectures/sase/
-https://docs.n8n.io/hosting/installation/server-setups/digital-ocean/#open-ports
-https://developer.konghq.com/gateway/install/docker/