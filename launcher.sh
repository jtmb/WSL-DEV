#!/bin/bash

# Path to the setup script
SETUP_SCRIPT="setup.sh"

# Function to display ASCII art
display_ascii_art() {
    echo
    cat << "EOF"
██╗    ██╗███████╗██╗         ██████╗ ███████╗██╗   ██╗
██║    ██║██╔════╝██║         ██╔══██╗██╔════╝██║   ██║
██║ █╗ ██║███████╗██║         ██║  ██║█████╗  ██║   ██║
██║███╗██║╚════██║██║         ██║  ██║██╔══╝  ╚██╗ ██╔╝
╚███╔███╔╝███████║███████╗    ██████╔╝███████╗ ╚████╔╝ 
 ╚══╝╚══╝ ╚══════╝╚══════╝    ╚═════╝ ╚══════╝  ╚═══╝  
https://github.com/jtmb                                                                                                  
EOF
echo  
}

# Function to display a menu using select
show_menu() {
    display_ascii_art
    echo "Choose an action:"
    PS3="Enter your choice (1-14): "
    options=("Install All" "Create Directories" "Create Secrets" "Set Permissions" "Add Aliases" "Configure Git" "Vault Authentication Scripts" "Setup Custom Shell Themes" "Setup Ansible Inventory"  "Exit")
    select opt in "${options[@]}"; do
        case $opt in
            "Install All")
                bash "$SETUP_SCRIPT" all
                ;;
            "Create Directories")
                bash "$SETUP_SCRIPT" create_directories
                ;;
            "Create Secrets")
                bash "$SETUP_SCRIPT" create_secrets
                ;;
            "Set Permissions")
                bash "$SETUP_SCRIPT" set_permissions
                ;;
            "Install Terraform")
                bash "$SETUP_SCRIPT" install_terraform
                ;;
            "Add Aliases")
                bash "$SETUP_SCRIPT" add_aliases
                ;;
            "Configure Git")
                bash "$SETUP_SCRIPT" configure_git
                ;;
            "Vault Authentication Scripts")
                bash "$SETUP_SCRIPT" create_vault_auth_script
                ;;
            "Setup Custom Shell Themes")
                bash "$SETUP_SCRIPT" shell_themes
                ;;
            "Setup Ansible Inventory")
                bash "$SETUP_SCRIPT" inv
                ;;
            "Exit")
                exit 0
                ;;
            *)
                echo "Invalid option $REPLY"
                ;;
        esac
        # Display the menu again after an action is completed
        echo
        show_menu
        break  # Exit the select loop to re-display the menu
    done
}

# Main script loop
show_menu
