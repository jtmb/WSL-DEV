# Function to display help
help() {
    echo "Usage: $0 <command>"
    echo
    echo "Commands:"
    echo "  install_packages    Install required packages."
    echo "  install_ansible      Install Ansible."
    echo "  install_terraform   Install Terraform."
    echo "  install_vault       Install Vault."
    echo "  add_aliases         Add aliases to .bashrc."
    echo "  install_all         Install all components and add aliases."
    echo "  -help               Display this help message."
}