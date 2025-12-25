#!/usr/bin/env bash
# docker-init.sh

USER=$(whoami)

# Fix ownership of APT directories and /wsl-dev
sudo chown -R ubuntu:ubuntu /wsl-dev /home/ubuntu/dev /usr/local/bin/

# Optional: ensure /scripts is writable if you use it
sudo mkdir -p /scripts
sudo chown -R ubuntu:ubuntu /scripts

# Show banner on login
echo
cat << "EOF"
██╗    ██╗███████╗██╗         ██████╗ ███████╗██╗   ██╗
██║    ██║██╔════╝██║         ██╔══██╗██╔════╝██║   ██║
██║ █╗ ██║███████╗██║         ██║█████╗  ██║   ██║
██║███╗██║╚════██║██║         ██║██╔══╝  ╚██╗ ██╔╝
╚███╔███╔╝███████║███████╗    ██████╔╝███████╗ ╚████╔╝ 
 ╚══╝╚══╝ ╚══════╝╚══════╝    ╚═════╝  ╚══════╝  ╚═══╝  
https://github.com/jtmb
EOF
echo

# Check if Ansible is installed
if command -v ansible-playbook &>/dev/null; then
    ansible_version=$(ansible-playbook --version | head -n1 | awk '{print $2}')
    echo "Ansible is installed (version $ansible_version)"
else
    echo "Ansible is NOT installed. Installing now..."
    # Make sure your installer script exists and is executable
    if [ -f /wsl-dev/install_ansible.sh ]; then
        bash /wsl-dev/install_ansible.sh
        echo "Ansible installation complete!"
    else
        echo "ERROR: /wsl-dev/install_ansible.sh not found. Cannot install Ansible."
    fi
fi

# Launch your main dev launcher in the background
/wsl-dev/launcher.sh &

# Keep container alive
exec bash
