## 0- Prerequisites

A virtual machine with Debian 12 installed.

### Why Debian over Ubuntu?

TLDR: Stability over bleeding-edge packages
Detailed Answer: Debian provides exceptional stability, security, and long-term support, making it ideal for production environments.
Learn more about Why Debian at:
https://wiki.debian.org/WhyDebian#Why_Linux.3F_Why_Debian.3F

<pre> ```bash apt update && apt upgrade -y``` </pre>

## 1- Monitoring Setup with HetrixTools

### Why HetrixTools?
A method to monitor your swarm and containers *outside* the swarm.
Free tier with generous monitoring capabilities.
Real-time notifications via Discord and Telegram.
Automated alerts when your VM/container goes down.
Comprehensive monitoring and logging.

## 2- Installation Steps

Sign up for HetrixTools.
Create an account at HetrixTools.
Add a new server in your dashboard.

For visual learners:
[HetrixTools Setup Tutorial](https://www.youtube.com/watch?v=m0LFzuVTtbA)


<pre> ```bash wget -qO- https://raw.githubusercontent.com/hetrixtools/agent/master/hetrixtools_install.sh | sudo bash -s YOUR_UNIQUE_CODE_HERE 1 0 1 1 1 80,443``` </pre>

Replace this example command in hetrixtools-install.sh with your actual HetrixTools installation command.
Copy, paste, and execute the hetrixtools-install.sh content into your terminal.


## 3- Verification

Check your HetrixTools dashboard to confirm your server appears online.
Test notifications by triggering an alert condition.
Verify all monitored services are reporting correctly.

## 4- Hostname Configuration Guide

Purpose: Configure system hostname for proper identification in Docker Swarm cluster.

Copy, paste, and execute change-hostname.sh content into your terminal.

Reboot with:

<pre> ```bash shutdown -r now``` </pre>

Verification

After reboot, verify with:

<pre> ```bash hostnamectl status``` </pre>

It should show you:

<pre> ```manager1``` </pre>


## 5- System Optimization
Copy and paste this in your terminal:

<pre> ```bash sudo nano /etc/sysctl.conf``` </pre>

Paste the contents of your optimizations.conf file into sysctl.conf, save, and apply changes with:

<pre> ```bash sudo sysctl -p``` </pre>