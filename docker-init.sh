#!/usr/bin/env bash
# docker-init.sh
# Purpose: Initialize the container environment for the wsl-dev image.
# Actions performed:
#  - Copy missing skeleton dotfiles from /etc/skel into /dev-box/home for mounted or host-shared home directories
#  - Fix ownership/permissions for commonly-used directories and the Docker socket
#  - Ensure the 'ubuntu' user is added to the 'docker' group
#  - Install a friendly ASCII banner into the system bashrc for interactive shells
#  - Launch an interactive shell to keep the container alive

USER=$(whoami)  # the user running this script (usually root during image/container initialization

# Fix ownership and permissions for commonly used directories and files.
# Use recursive chown to set both owner and group to 'ubuntu' for these paths.
sudo chown -R ubuntu:ubuntu /wsl-dev /home/ubuntu/repos /usr/local/bin /scripts /home/ubuntu/.bashrc /home/ubuntu

# Ensure the 'ubuntu' user's home directory has standard dotfiles
sudo cp /etc/skel/.bashrc /home/ubuntu/
sudo cp /etc/skel/.profile /home/ubuntu/
sudo cp /etc/skel/.bash_logout /home/ubuntu/

# Give the ubuntu user ownership of the Docker socket so they can run docker without sudo inside the container
sudo chown ubuntu:ubuntu /var/run/docker.sock

# Add the 'ubuntu' user to the docker group so docker commands can be run without sudo.
# -aG: append (-a) the user to the supplementary group (-G)
sudo usermod -aG docker ubuntu

# Install an interactive banner into the system-wide bashrc so interactive shells show the banner.
sudo tee /etc/bash.bashrc >/dev/null <<'EOF'

# ---- Container Banner ----
# Exit early for non-interactive shells
[[ $- != *i* ]] && return

echo
cat << "BANNER"
██████╗ ███████╗██╗   ██╗    ██████╗  ██████╗ ██╗  ██╗
██╔══██╗██╔════╝██║   ██║    ██╔══██╗██╔═══██╗╚██╗██╔╝
██║  ██║█████╗  ██║   ██║    ██████╔╝██║   ██║ ╚███╔╝ 
██║  ██║██╔══╝  ╚██╗ ██╔╝    ██╔══██╗██║   ██║ ██╔██╗ 
██████╔╝███████╗ ╚████╔╝     ██████╔╝╚██████╔╝██╔╝ ██╗
╚═════╝ ╚══════╝  ╚═══╝      ╚═════╝  ╚═════╝ ╚═╝  ╚═╝
https://github.com/jtmb
BANNER
echo
# ---- End Banner ----

EOF

# Keep container alive: launch an interactive bash shell so the container doesn't immediately exit
exec bash
