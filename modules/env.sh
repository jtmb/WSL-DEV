# Function to create .secrets folder and files
create_secrets() {
    echo "Creating .secrets directory..."
    mkdir -p "$secrets_dir"
    mkdir -p "$repos_dir"
    
    echo "Creating files..."
    
    for file in "${SECRETS_FILES[@]}"; do
        # Check if file is inventory.ini and add specific content
        if [ "$file" == "inventory.ini" ]; then
            echo "Creating $file with content..."
            cat <<EOF > "$secrets_dir/$file"
[prd]
desired_hostname_here      ansible_host=192.168.0.x

[dev]
desired_hostname_here      ansible_host=192.168.0.x

[other]
desired_hostname_here        ansible_host=192.168.0.x

[network]
router          ansible_host=192.168.0.1

[prd:vars]
ansible_user=$USER
ansible_port=22
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
ansible_ssh_private_key_file=/home/$USER/.ssh/id_ed25519

[dev:vars]
ansible_user=$USER
ansible_port=22
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
ansible_ssh_private_key_file=/home/$USER/.ssh/id_ed25519

[other:vars]
ansible_user=$USER
ansible_port=22
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
ansible_ssh_private_key_file=/home/$USER/.ssh/id_ed25519
EOF
        else
            echo "Creating $file..."
            touch "$secrets_dir/$file"
        fi
    done
    
    echo ".secrets folder and files created successfully!"
}

# Function to set permissions for a folder and files
set_permissions() {
    echo "Applying permissions..."
    
    for item in "${PERMISSIONS_CONFIG[@]}"; do
        local path="${item%% *}"
        local perms="${item##* }"
        
        echo "Setting permissions $perms for $path..."
        
        # Check if path contains a wildcard
        if [[ "$path" == *'*'* ]]; then
            # Use a loop to handle wildcard patterns
            for file in $path; do
                if [ -e "$file" ]; then
                    sudo chmod "$perms" "$file"
                else
                    echo "File or directory $file does not exist."
                fi
            done
        else
            sudo chmod -R "$perms" "$path"
        fi
    done
    
    echo "Permissions set successfully!"
}

