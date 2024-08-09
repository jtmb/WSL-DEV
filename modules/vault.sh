#!/bin/bash
# Function to install Vault
install_vault() {
    echo "Installing Vault..."
    wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip
    sudo unzip vault_${VAULT_VERSION}_linux_amd64.zip -d /usr/local/bin/
    rm vault_${VAULT_VERSION}_linux_amd64.zip
}