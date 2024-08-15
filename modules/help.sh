# Set the environment variable for the alias
export WSL_CMD=wsl
help() {
    # Use the environment variable WSL_CMD if set, otherwise fall back to the script name
    local cmd_name="${WSL_CMD:-$(basename "$0")}"
    echo
    echo "Usage: $cmd_name <command>"
    echo
    echo "       $cmd_name <command1> <command2> <command3> "
    echo
    echo "Commands:"
    echo "  all                 Install all components and add aliases."
    echo "  install_packages    Install required packages."
    echo "  install_ansible     Install Ansible."
    echo "  install_terraform   Install Terraform."
    echo "  install_vault       Install Vault."
    echo "  add_aliases         Add aliases to .bashrc."
    echo "  create_secrets      Setup secrets files."
    echo "  set_permissions     Set secure permissions for home folders."
    echo "  configure_git       Configure local git."
    echo "   shell_themes       Install custom shell themes."
    echo "  -help               Display this help message."
}
