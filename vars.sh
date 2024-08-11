# Define secrets dir
export SECRETES_DIR="$HOME/.secrets"
# Define extra dirs to be created
export DIRECTORIES=(
    "$HOME/repos"
    "$HOME/temp"
)

# Set Git Creds
GIT_USER_EMAIL="your-email-here"
GIT_USER_NAME="username-here"

# Define versions and packages
PACKAGES=(
    "jq" 
    "net-tools" 
    "zip"
)

ANSIBLE_VERSION="2.16"
TERRAFORM_VERSION="1.4.0"
VAULT_VERSION="1.13.0"

# Define your aliases
ALIASES=(
    "alias ll='ls -la'" #example
    "alias wsl='WSL_CMD=wsl cd /WSL-DEV && bash setup.sh'"
    "alias auth-me='bash /scripts/vault-auth.sh'"
    "alias inv='bash /scripts/inventory-parser.sh'"
    "alias cdi='cd $HOME/.secrets/'"
)
# Define your Secrets
SECRETS_FILES=(
    "inventory.ini"
    "vault_server"
    "vault_token"
)

# Define permissions and file patterns
PERMISSIONS_CONFIG=(
    "$HOME/.ssh 700"
    "$HOME/.ssh/id_* 600"
    "$HOME/.secrets 700"
    "$HOME/.repos 755"
    "/scripts 755"
    "/WSL-DEV 755"
)