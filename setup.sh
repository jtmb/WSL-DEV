#!/bin/bash

# Import Modules
chmod +x modules/*.sh
source modules/opt_packages.sh
source modules/ansible.sh
source modules/terraform.sh
source modules/vault.sh
source modules/help.sh
source modules/env.sh
source vars.sh

# Define versions and packages
ANSIBLE_VERSION="2.16"
PACKAGES=("jq" "net-tools")
TERRAFORM_VERSION="1.4.0"
VAULT_VERSION="1.13.0"

# Define your aliases
ALIASES=(
    "alias ll='ls -la'" # Example
)

# Function to add aliases to .bashrc
add_aliases() {
    local bashrc_file="$HOME/.bashrc"
    
    echo "Adding aliases to $bashrc_file..."
    
    # Backup the original .bashrc
    cp "$bashrc_file" "$bashrc_file.bak"

    # Check if aliases already exist
    for alias in "${ALIASES[@]}"; do
        if grep -Fxq "$alias" "$bashrc_file"; then
            echo "Alias '$alias' already exists in $bashrc_file."
        else
            echo "$alias" >> "$bashrc_file"
            echo "Added alias: $alias"
        fi
    done

    # Reload .bashrc
    echo "Reloading .bashrc..."
    source "$bashrc_file"

    echo "Aliases added and .bashrc reloaded successfully!"
}
    
# Function for help screen 
help_function() {
    help
}
# Function to install all components
install_all() {
    install_packages
    install_ansible
    install_terraform
    install_vault
    add_aliases
    create_secrets
    set_permissions

}

# Main script logic to handle arguments
case "$1" in
    install_packages)
        install_packages
        ;;
    install_ansible)
        install_ansible
        ;;
    install_terraform)
        install_terraform
        ;;
    install_vault)
        install_vault
        ;;
    add_aliases)
        add_aliases
        ;;
    install_all | "")
        install_all
        ;;
    create_secrets | "")
        create_secrets
        ;;
    set_permissions)
        set_permissions
        ;;
    -help | help)
        help
        ;;
    *)
        echo "Invalid option. Use '-help' for usage information."
        exit 1
        ;;
esac

echo "Provisioning completed successfully!"
