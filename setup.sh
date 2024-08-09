#!/bin/bash

# Import Modules
sudo chmod +x modules/*.sh
source modules/opt_packages.sh
source modules/ansible.sh
source modules/terraform.sh
source modules/vault.sh
source modules/help.sh
source modules/env.sh
source modules/bashrc_alias.sh
source modules/git_config.sh
source vars.sh

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
    configure_git
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
        fi
    done
}

# Main script logic to handle arguments
if [ $# -eq 0 ]; then
    echo "No arguments provided. Use '-help' for usage information."
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

echo "Provisioning completed successfully!"
