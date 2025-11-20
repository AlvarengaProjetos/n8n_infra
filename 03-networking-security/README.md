# Networking and security
## Cloudflare Tunnel DNS, WAF and configurations
### Why Cloudflare Tunnel over a reverse proxy + load balancer?
- First, Cloudflare Tunnel is an efficient solution because it has built-in load balancing capabilities. This distributes traffic effectively across multiple servers or services, providing the benefits of load balancing and high availability without the overhead of a dedicated one.
- Additionally, using cloudflared is a simple alternative that eliminates the need to set up and manage a complex infrastructure. This is ideal when you don't require granular traffic control.
- Its seamless integration with containerized environments is another key advantage. Since services in these environments scale dynamically, Cloudflare Tunnel automatically handles routing and security, unlike a traditional load balancer that requires additional configuration.
- Finally, by exposing applications through Cloudflare Tunnel, they gain the full benefits of Cloudflare's DNS, CDN, and DDoS services, as well as its WAF, API, and bot services—all without exposing the application servers directly to the internet.
- Of course, it's not perfect and it will have [downtime](https://www.techworm.net/2025/11/cloudflare-outage-disrupts-global-internet-traffic.html) as any service out there, just like AWS and Azure.

### Tunnel setup
0- Onboard a domain
- Go to **Account home**
- Purchase one through Cloudflare or any provider of your choice.
- Onboard a domain

1- Initial form
- Create a Cloudflare account
- Go to **Zero Trust** tab
- Name your team
- Select the free plan
- Put your credid card and pay $0,00
- Fill out the form

2- Tunnel config
- In **Zero Trust** tab, go to **Networks**
- Add a Tunnel
- Select **Cloudflared tunnel**
- Name your tunnel. You can name it after your company, your client, or your main manager (Manager1)
- Now the tunnel is created

### Cloudflare token
In **docker-compose.cloudflared.yaml** file, you need to provide a token. After creating the first tunnel on Cloudflare's website, go to the Tunnels tab. There, you'll see an option called "Install and Execute Connector" along with a box that contains the token. The box will look like:

```
cloudflared.exe service install *YOUR_TOKEN_HERE*
```

Copy and paste this token into **docker-compose.cloudflared.yaml**

### Cloudflared Docker Compose Setup
- First, make sure you are in the root directory of the project where the docker-compose.cloudflared.yaml file will be placed.
- Run the following command to create and edit the file:
```bash
nano docker-compose.cloudflared.yaml
```
- In the nano editor, paste the content of the docker-compose.cloudflared.yaml file (including the Cloudflare token you obtained) into the file.
- After pasting the content, save your changes and exit the editor by pressing ```Ctrl + O``` to save, then Enter, and finally ```Ctrl + X``` to exit.
- Run the deploy script to start the process. In the terminal, execute **deploy-tunnel.sh** content.
- To verify that the Cloudflared container has been deployed correctly, run the following command:
```bash
docker ps
```
- Make sure you see the cloudflared container in the list.


### App routes
- In the Cloudflare dashboard, navigate to **Zero Trust**
- Open the **Connectors** tab
- Click on your tunnel name
- Select **Edit**
- Go to **Published application routes**
- Click **Add a published application route**
- In **Subdomain**, enter the service name. For example, for n8n you might use something like **workflows**. It’s good practice to avoid using the literal service name (e.g., n8n, Portainer, Grafana), so be a bit creative.
- In **Domain**, enter your domain.
- Leave **Path** empty unless it’s a Kong URL.
- Set **Type** to HTTP.
- For URL, you can use one of the following options for the respective service:
    ```n8n_editor:5678```
    ```n8n_webhook:5678```
    ```portainer:9000```
    ```grafana:3000```
    ```prometheus:9090```
    ```kong:8000```

### DNS check
It’s good practice to verify DNS propagation *before* trying to access your domain and subdomains. trying to access your domain or any subdomains. For example, if your domain is ```n8n-infra-automation.com``` and your n8n subdomain is ```workflows.n8n-infra-automation.com```, check both using the tools below. If needed, wait a few hours for full propagation.


- https://www.whatsmydns.net/
- https://dnschecker.org/
- https://www.lookup-dns.com/

## Firewall rules
Only ports 443 (HTTPS) and 80 (HTTP) should be open to the public. They must be open for N8n to function properly.
Port 22 (SSH) must remain closed by default and should only be opened temporarily when terminal access is required.



## Kong








### Reference
- https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/configure-tunnels/tunnel-availability/

- https://hub.docker.com/r/cloudflare/cloudflared

- https://developers.cloudflare.com/reference-architecture/architectures/sase/

- https://docs.n8n.io/hosting/installation/server-setups/digital-ocean/#open-ports

- https://developer.konghq.com/gateway/install/docker/