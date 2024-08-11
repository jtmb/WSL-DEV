#!/bin/bash

# Import Modules
sudo chmod +x modules/*.sh
source modules/opt_packages.sh
source modules/env.sh
source modules/vault.sh
source modules/ansible.sh
source modules/terraform.sh
source modules/help.sh
source modules/bashrc_alias.sh
source modules/git_config.sh
source vars.sh

# Function for help screen 
help_function() {
    help
}

# Function to install all components
all() {
    install_packages
    create_directories
    create_secrets
    set_permissions
    install_vault
    install_ansible
    install_terraform
    add_aliases
    configure_git
    create_vault_auth_script    
}

# Function to check if a function is defined
is_function_defined() {
    declare -F "$1" > /dev/null
}

# Execute the specified functions
execute_functions() {
    for func in "$@"; do
        if is_function_defined "$func"; then
            echo "Executing $func..."
            "$func"
        else
            echo "Function $func not found!"
            help_function
            exit 1
        fi
    done
}

# Main script logic to handle arguments
if [ $# -eq 0 ]; then
    help_function
    exit 1
fi

case "$1" in
    -help | help)
        help_function
        ;;
    install_all)
        install_all
        ;;
    *)
        execute_functions "$@"
        ;;
esac

echo "Provisioning completed successfully, please restart your wsl session."
