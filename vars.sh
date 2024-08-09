# Set Git Creds

$GIT_USER_EMAIL="james.branco@gmail.com"
$GIT_USER_NAME="jtmb"

# Define versions and packages
ANSIBLE_VERSION="2.16"
PACKAGES=("jq" "net-tools" "zip")
TERRAFORM_VERSION="1.4.0"
VAULT_VERSION="1.13.0"

# Define Directories
export secrets_dir="$HOME/.secrets"
export repos_dir="$HOME/.repos"

# Define your aliases
ALIASES=(
    "alias ll='ls -la'" #example
    "alias wsl='cd /WSL-DEV && bash setup.sh'" 
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
    "$HOME/.secrets 700"
    "$HOME/.repos 700"
)