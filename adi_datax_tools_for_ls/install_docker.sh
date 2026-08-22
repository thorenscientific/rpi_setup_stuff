#!/bin/bash

set -e

echo "Downloading Docker install script..."
curl -fsSL https://get.docker.com -o get-docker.sh

echo "Running Docker install script..."
sudo sh get-docker.sh

echo "Adding current user ($USER) to docker group..."
sudo usermod -aG docker "$USER"

echo ""
echo "Docker installed successfully."
echo "Log out and back in (or run 'newgrp docker') for group membership to take effect."