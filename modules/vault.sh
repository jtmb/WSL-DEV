#!/bin/bash
# Function to install Vault
install_vault() {
    echo "Installing Vault..."
    wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip
    sudo unzip vault_${VAULT_VERSION}_linux_amd64.zip -d /usr/local/bin/
    rm vault_${VAULT_VERSION}_linux_amd64.zip
}

# Function to create vault-auth.sh script if the Vault server file exists
create_vault_auth_script() {
    local vault_server_file="$HOME/.secrets/vault_server"
    local vault_token_file="$HOME/.secrets/vault_token"
    local script_dir="/scripts"
    local script_path="$script_dir/vault-auth.sh"
    
    # Check if the vault_server file exists
    if [ -e "$vault_server_file" ] && [ -e "$vault_token_file" ]; then
        echo "Creating /scripts directory..."
        mkdir -p "$script_dir"
        
        echo "Creating vault-auth.sh script..."
        cat <<EOF > "$script_path"
#!/bin/bash

# Auth to Vault
AUTH_TOKEN=\$(cat $vault_token_file) > /dev/null 2>&1 
VAULT_SERVER=\$(cat $vault_server_file) > /dev/null 2>&1 

# Export for current session
export VAULT_ADDR=\$VAULT_SERVER > /dev/null 2>&1 
export VAULT_TOKEN=\$AUTH_TOKEN > /dev/null 2>&1 

# Attempt to log in to Vault
output=\$(vault login \$VAULT_TOKEN 2>&1)

# Check if the login was successful
if [[ \$output == *"Success!"* ]]; then
    echo "Success! Authenticated with Vault. 🔓✅"
else
    echo "ERROR Authenticating with Vault. 🔐⛔"
    echo "\$output"
fi
EOF

        # Make the script executable
        chmod +x "$script_path"
        
        echo "vault-auth.sh script created successfully in /scripts!"
    else
        echo "Vault server or token file does not exist. Skipping script creation."
    fi
}