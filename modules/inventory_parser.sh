#!/bin/bash

# Function to display usage information
help() {
    echo "Usage: inv <host_or_group> <command> [-sudo]"
    echo
    echo "Arguments:"
    echo "  <host_or_group>  The target host or group defined in the Ansible inventory."
    echo "  <command>        The shell command to be executed on the target host or group."
    echo "  -sudo            Optional flag to run the command with sudo."
    echo
    echo "Examples:"
    echo "  inv retropie \"uptime\""
    echo "  inv prd \"df -h\" -sudo"
    echo
    echo "For more help, refer to the Ansible documentation."
}

# Function to execute ansible command
inv() {
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

    # Initialize variables
    local command=""
    local sudo_flag=""

    # Check if the last argument is "-sudo"
    if [ "${!#}" == "-sudo" ]; then
        sudo_flag="--become --ask-become-pass"
        # Remove "-sudo" from the arguments
        set -- "${@:1:$(($#-1))}"
    fi

    # Combine the remaining arguments into the command
    command="$*"

    # Debugging: Print the host/group, command, and sudo flag
    echo "Host or Group: $host_or_group"
    echo "Command: $command"
    echo "Sudo Flag: $sudo_flag"

    # Debugging: Print the path to inventory.ini
    local inventory_path="$(realpath .secrets/inventory.ini)"
    echo "Inventory Path: $inventory_path"

    # Run the ansible command
    ansible "$host_or_group" -i "$inventory_path" -m shell -a "$command" $sudo_flag
}

# Call the inv function with all script arguments
inv "$@"
