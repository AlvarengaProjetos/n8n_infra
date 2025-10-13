#!/bin/bash
#
# Hostname Configuration Script
# Configures system hostname for Docker Swarm cluster identification
#

set -e

NEW_HOSTNAME="manager1"

echo "Configuring system hostname to: $NEW_HOSTNAME"

# Set hostname using hostnamectl
hostnamectl set-hostname "$NEW_HOSTNAME"

# Update /etc/hosts for hostname persistence
sed -i "s/^127\.0\.0\.1.*/127.0.0.1    localhost $NEW_HOSTNAME/" /etc/hosts

echo "Hostname configuration completed."
echo "Please reboot the system to apply changes: sudo reboot"