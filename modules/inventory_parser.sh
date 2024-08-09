#!/bin/bash

# Function to display usage information
help() {
    echo "Usage: inv <host_or_group> <command>"
    echo
    echo "Arguments:"
    echo "  <host_or_group>  The target host or group defined in the Ansible inventory."
    echo "  <command>        The shell command to be executed on the target host or group."
    echo
    echo "Examples:"
    echo "  inv retropie \"uptime\""
    echo "  inv prd \"df -h\""
    echo
    echo "For more help, refer to the Ansible documentation."
}

# Function to execute ansible command
inv() {
    # Debugging: Print the number of arguments
    # echo "Number of arguments: $#"
    # echo "Arguments: $@"

    # Check if at least 2 arguments are provided
    if [ $# -lt 2 ]; then
        help
        return 1
    fi

    # Check if the first argument is "help"
    if [ "$1" == "help" ]; then
        help
        return 0
    fi

    # Extract the host or group
    local host_or_group=$1
    shift

    # Combine the remaining arguments into the command
    local command="$*"

    # Debugging: Print the host/group and command
    echo "Host or Group: $host_or_group"
    echo "Command: $command"

    # Debugging: Print the path to inventory.ini
    local inventory_path="$(realpath .secrets/inventory.ini)"
    echo "Inventory Path: $inventory_path"

    # Run the ansible command
    ansible "$host_or_group" -i "$inventory_path" -m shell -a "$command"
}

# Call the inv function with all script arguments
inv "$@"
