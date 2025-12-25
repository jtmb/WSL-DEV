#!/bin/bash
# Function to install Ansible
install_ansible() {
    echo "Installing Ansible..."
    # Update package index
    sudo apt update -y

    # Install required dependencies
    sudo apt install -y software-properties-common gnupg lsb-release curl

    # Add Ansible PPA
    sudo add-apt-repository --yes --update ppa:ansible/ansible

    # Update package index again
    sudo apt update -y

    # Install Ansible
    sudo apt install -y ansible

    # Verify installation
    echo "Ansible version installed:"
    ansible --version
    ansible_version_installed=$(ansible --version | head -n 1 | awk '{print $2}')
    
    if [ "$(printf '%s\n' "$ANSIBLE_VERSION" "$ansible_version_installed" | sort -V | head -n1)" != "$ANSIBLE_VERSION" ]; then
        echo "Upgrading Ansible to version $ANSIBLE_VERSION..."
         sudo apt-get install -y python3-pip
        pip3 install --upgrade ansible=="$ANSIBLE_VERSION"
    fi
}