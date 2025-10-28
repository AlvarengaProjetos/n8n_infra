#### 0- Prerequisites ####
# A virtual machine with Debian 13 installed

# Why Debian over Ubuntu?
# TLDR: Stability over bleeding-edge packages
# Detailed Answer: Debian provides exceptional stability, security, and long-term support, making it ideal for production environments. Learn more about Why Debian at https://wiki.debian.org/WhyDebian#Why_Linux.3F_Why_Debian.3F

# Update Linux
apt update && apt upgrade -y

#### 1- Monitoring Setup with HetrixTools ####
# Why HetrixTools?
# Free tier with generous monitoring capabilities. Real-time notifications via Discord and Telegram. Automated alerts when your VM/container goes down. Comprehensive monitoring and logging.

#### 2- Installation Steps ####
# Sign up for HetrixTools
# Create an account at HetrixTools
# Add a new server in your dashboard. For visual learners: HetrixTools Setup Tutorial https://www.youtube.com/watch?v=m0LFzuVTtbA

# Copy your unique installation command. It should look like this:
wget -qO- https://raw.githubusercontent.com/hetrixtools/agent/master/hetrixtools_install.sh | sudo bash -s YOUR_UNIQUE_CODE_HERE 1 0 1 1 1 80,443
# Replace this example command at hetrixtools-instal.sh with your actual HetrixTools installation command
# Copy, paste and execute hetrixtools-install.sh content into your terminal


#### 3- Verification ####
# Check your HetrixTools dashboard to confirm your server appears online
# Test notifications by triggering an alert condition
# Verify all monitored services are reporting correctly

#### 4- Hostname Configuration Guide ####
# Purpose: Configure system hostname for proper identification in Docker Swarm cluster.
# Copy, paste and execute change-hostname.sh content into your terminal
# Reboot with:
shutdown -r now

## Verification
# After reboot, verify with:
hostnamectl status

# It should show you 'manager1'

#### 5- System Optimization ####
# Copy and paste trhis in your terminal:
sudo nano /etc/sysctl.conf

# Paste the contents of your optimizations.conf file into this file, save, and apply changes:
sudo sysctl -p



## 0- Prerequisites

A virtual machine with Debian 13 installed.

Why Debian over Ubuntu?

TLDR: Stability over bleeding-edge packages
Detailed Answer: Debian provides exceptional stability, security, and long-term support, making it ideal for production environments.
Learn more about Why Debian at:
https://wiki.debian.org/WhyDebian#Why_Linux.3F_Why_Debian.3F

apt update && apt upgrade -y

1- Monitoring Setup with HetrixTools
Why HetrixTools?
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


wget -qO- https://raw.githubusercontent.com/hetrixtools/agent/master/hetrixtools_install.sh | sudo bash -s YOUR_UNIQUE_CODE_HERE 1 0 1 1 1 80,443

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

shutdown -r now

Verification

After reboot, verify with:

hostnamectl status

It should show you:

manager1


## 5- System Optimization
Copy and paste this in your terminal:

sudo nano /etc/sysctl.conf

sudo sysctl -p