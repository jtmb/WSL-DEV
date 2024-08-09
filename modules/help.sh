# Function to display help
help() {
    echo
    echo "Usage: $0 <command>"
    echo 
    echo "       $0 <command1> <command2 <command3>"
    echo 
    echo
    echo "Commands:"
    echo "  install_all         Install all components and add aliases."
    echo "  install_packages    Install required packages."
    echo "  install_ansible      Install Ansible."
    echo "  install_terraform   Install Terraform."
    echo "  install_vault       Install Vault."
    echo "  add_aliases         Add aliases to .bashrc."
    echo "  create_secrets      Setup secrets files."
    echo "  set_permissions     Set secure permissions for home folders."
    echo "  configure_git       Configure local git."
    echo "  -help               Display this help message."
}