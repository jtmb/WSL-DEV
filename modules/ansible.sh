#!/bin/bash
# Function to install Ansible
install_ansible() {
    echo "Installing Ansible..."
     apt-add-repository -y ppa:ansible/ansible
     apt update
     apt install -y ansible
    ansible_version_installed=$(ansible --version | head -n 1 | awk '{print $2}')
    
    if [ "$(printf '%s\n' "$ANSIBLE_VERSION" "$ansible_version_installed" | sort -V | head -n1)" != "$ANSIBLE_VERSION" ]; then
        echo "Upgrading Ansible to version $ANSIBLE_VERSION..."
         apt-get install -y python3-pip
        pip3 install --upgrade ansible=="$ANSIBLE_VERSION"
    fi
}