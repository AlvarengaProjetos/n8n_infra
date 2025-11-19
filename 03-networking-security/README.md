# Networking security



## Cloudflare Tunnel
### Why Cloudflare Tunnel over a reverse proxy + load balancer?
- First, Cloudflare Tunnel is an efficient solution because it has built-in load balancing capabilities. This distributes traffic effectively across multiple servers or services, providing the benefits of load balancing and high availability without the overhead of a dedicated one.
- Additionally, using cloudflared is a simple alternative that eliminates the need to set up and manage a complex infrastructure. This is ideal when you don't require granular traffic control.
- Its seamless integration with containerized environments is another key advantage. Since services in these environments scale dynamically, Cloudflare Tunnel automatically handles routing and security, unlike a traditional load balancer that requires additional configuration.
- Finally, by exposing applications through Cloudflare Tunnel, they gain the full benefits of Cloudflare's DNS, CDN, and DDoS services, as well as its WAF, API, and bot services—all without exposing the application servers directly to the internet.

### Cloudflare token
In docker-compose.cloudflared.yaml there is a token you must put. After creted the first tunnel on cloudflare.com there will be at the tunnel tab "install and execure connector" and a box like:

<pre> cloudflared.exe service install *YOUR_TOKEN_HERE*</pre>

Copy and paste this token into docker-compose.cloudflared.yaml

## Firewall
All ports must say closed. We open only 443 and 80 for web traffic only.


## Kong








### Reference
-https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/configure-tunnels/tunnel-availability/
-https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/configure-tunnels/tunnel-availability/
-https://hub.docker.com/r/cloudflare/cloudflared
-https://developers.cloudflare.com/reference-architecture/architectures/sase/
-https://docs.n8n.io/hosting/installation/server-setups/digital-ocean/#open-ports
-https://developer.konghq.com/gateway/install/docker/