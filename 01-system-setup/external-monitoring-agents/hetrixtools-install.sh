#!/bin/bash
#
# Monitoring Agent Installation Script
# Installs and configures HetrixTools monitoring agent
#
# https://hetrixtools.com/

set -e

echo "Installing HetrixTools monitoring agent..."

# Run the install code as root in your server's terminal.
wget -qO- https://raw.githubusercontent.com/hetrixtools/agent/master/hetrixtools_install.sh | sudo bash -s 8sf8s1d*mockcode*f1s61df6 1 0 1 1 1 80,443

echo "Monitoring agent installation completed."