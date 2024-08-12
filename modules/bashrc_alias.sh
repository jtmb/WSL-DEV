# Function to add aliases to .bashrc
add_aliases() {
    local source_file="modules/inventory_parser.sh"
    local target_file="/scripts/inventory-parser.sh"
    local bashrc_file="$HOME/.bashrc"

    # Ensure the target directory exists
    sudo mkdir -p /scripts

    # Move the script to the target location
    sudo cp "$source_file" "$target_file"

    # Set executable permissions for the script
    sudo chmod +x "$target_file"

    echo "Script has been moved to $target_file and made executable."
    
    echo "Adding aliases to $bashrc_file..."
    # Setup /WSL-DEV folder for wsl alias
    sudo rm -rfv /WSL-DEV > /dev/null
    sudo cp -r $(pwd) / 
    sudo chmod 755 /WSL-DEV
    sudo chmod +x /WSL-DEV/setup.sh
    
    # Backup the original .bashrc
    cp "$bashrc_file" "$bashrc_file.bak"

    # Check if aliases already exist
    for alias in "${ALIASES[@]}"; do
        if grep -Fxq "$alias" "$bashrc_file"; then
            echo "Alias '$alias' already exists in $bashrc_file."
        else
            echo "$alias" >> "$bashrc_file"
            echo "Added alias: $alias"
        fi
    done

    # Reload .bashrc
    echo "Reloading .bashrc..."
    source /home/$USER/.bashrc

    echo "Aliases added and .bashrc reloaded successfully!"
}
