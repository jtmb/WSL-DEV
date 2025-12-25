#!/bin/bash

# Function to install packages
install_packages() {
    echo "Updating package list..."
     apt update

    echo "Installing packages..."
    for package in "${PACKAGES[@]}"; do
         apt install -y "$package"
    done
}