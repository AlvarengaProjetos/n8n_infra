#!/bin/bash
#
# System Update Script
# Performs system updates and basic package maintenance
#

set -e

echo "Starting system update..."

# Update package lists
apt update

# Upgrade installed packages
apt upgrade -y

# Install essential system utilities
apt install -y cron wget curl

# Clean up package cache
apt autoremove -y
apt clean

echo "System update completed successfully."