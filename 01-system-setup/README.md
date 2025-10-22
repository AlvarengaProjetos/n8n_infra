### 0- Prerequisites ###
# A virtual machine with Debian 12 installed

# Why Debian over Ubuntu?
# TLDR: Stability over bleeding-edge packages
# Detailed Answer: Debian provides exceptional stability, security, and long-term support, making it ideal for production environments. Learn more about Why Debian at https://wiki.debian.org/WhyDebian#Why_Linux.3F_Why_Debian.3F

### 1- Monitoring Setup with HetrixTools ###
# Why HetrixTools?
# Free tier with generous monitoring capabilities. Real-time notifications via Discord and Telegram. Automated alerts when your VM/container goes down. Comprehensive monitoring and logging.

### 2- Installation Steps ###
# Update Linux
apt update && apt upgrade -y

# Sign up for HetrixTools
# Create an account at HetrixTools.
# Add a new server in your dashboard. For visual learners: HetrixTools Setup Tutorial https://www.youtube.com/watch?v=m0LFzuVTtbA.
# You can also check the official documentarion at https://docs.hetrixtools.com/category/uptime-monitor/

# Copy your unique installation command. It should look like this:
wget -qO- https://raw.githubusercontent.com/hetrixtools/agent/master/hetrixtools_install.sh | sudo bash -s YOUR_UNIQUE_CODE_HERE 1 0 1 1 1 80,443
# Replace the example command at hetrixtools-instal.sh with your actual HetrixTools installation command copy, paste and execute hetrixtools-install.sh content into your terminal.

### 3- Verification ###
# Check your HetrixTools dashboard to confirm your server appears online.
# Test notifications by triggering an alert condition.
# Verify all monitored services are reporting correctly.

### 4- Hostname Configuration Guide ###
# Purpose: Configure system hostname for proper identification in Docker Swarm cluster.
# Copy, paste and execute change-hostname.sh content into your terminal.
# Reboot with:
shutdown -r now

## Verification
# After reboot, verify with:
hostnamectl status

# It should show you 'manager1'.
# To add additional managers or workers, modify the `NEW_HOSTNAME` value accordingly (e.g., `manager2`, `worker1`, etc.).


#### 5- Linux Optimization ####
# Those values must be ajusted based on observations and tests
# Copy and paste this in your terminal:
sudo nano /etc/sysctl.conf

# Paste the contents of your optimizations.conf file into this file, save, and apply changes:
sudo sysctl -p


# Reference 

# https://wiki.debian.org/WhyDebian#Why_Linux.3F_Why_Debian.3F
# https://manpages.debian.org/trixie/apt/apt.8.en.html
# https://docs.hetrixtools.com/category/uptime-monitor/
# https://manpages.debian.org/trixie/systemd-sysv/shutdown.8.en.html
# https://linuxhandbook.com/debian-change-hostname/
# https://manpages.debian.org/trixie/procps/sysctl.8.en.html
# https://access.redhat.com/solutions/6964027#:~:text=Resolution,subtracting%20the%20zone%27s%20high%20mark.
# https://sempreupdate.com.br/sysctl-conf-linux-otimizacao-desempenho-rede/