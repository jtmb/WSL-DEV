#!/bin/bash
# Function to install Terraform
install_terraform() {
    echo "Installing Terraform..."
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
     unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin/
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
}
