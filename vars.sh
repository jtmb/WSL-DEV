# Define versions and packages
ANSIBLE_VERSION="2.16"
PACKAGES=("jq" "net-tools")
TERRAFORM_VERSION="1.4.0"
VAULT_VERSION="1.13.0"

# Define your aliases
ALIASES=(
    "alias ll='ls -la'" #example
)

SECRETS_FILES=(
    "inventory.ini"
    "vault_server"
    "vault_token"
)

# Define permissions and file patterns
PERMISSIONS_CONFIG=(
    "$HOME/.ssh 700"
    "$HOME/.ssh/id_* 600"
    "$HOME/.secrets 640"
)