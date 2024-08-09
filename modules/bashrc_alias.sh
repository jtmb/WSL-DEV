# Function to add aliases to .bashrc
add_aliases() {
    local bashrc_file="$HOME/.bashrc"
    
    echo "Adding aliases to $bashrc_file..."
    # Setup /WSL-DEV folder for wsl alias
    sudo cp -r $(pwd) / 
    sudo chmod 700 /WSL-DEV
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
    source "$bashrc_file"

    echo "Aliases added and .bashrc reloaded successfully!"
}
