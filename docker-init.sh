#!/usr/bin/env bash
# docker-init.sh

USER=$(whoami)

# Fix ownership of APT directories and /wsl-dev
sudo chown -R ubuntu:ubuntu /wsl-dev /home/ubuntu/dev /usr/local/bin/

# Optional: ensure /scripts is writable if you use it
sudo mkdir -p /scripts
sudo chown -R ubuntu:ubuntu /scripts

# Launch your main dev launcher
/wsl-dev/launcher.sh &

# Keep container alive
exec bash
