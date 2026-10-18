#!/bin/bash

# Update the package list

echo "Updating package lists..."
sudo apt update

# Install required packages

echo "Installing Git, Apache, Curl and Vim..."
sudo apt install git apache2 curl vim -y

# Start and enable Apache

echo "Starting Apache service..."
sudo systemctl enable --now apache2

# Verify Apache service

echo "Checking Apache status..."
sudo systemctl is-active apache2

echo "Server setup completed successfully!"

