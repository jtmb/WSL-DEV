#!/bin/bash

# Function to install packages
install_packages() {
    echo "Updating package list..."
     sudo apt update

    echo "Installing packages..."
    for package in "${PACKAGES[@]}"; do
         sudo apt install -y "$package"
    done
}