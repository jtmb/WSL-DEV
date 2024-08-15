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
    "alias wsl='cd /WSL-DEV && bash setup.sh'"
    "alias auth-me='bash /scripts/vault-auth.sh'"
    "alias inv='bash /scripts/inventory-parser.sh'"
    "alias cdi='cd $HOME/.secrets/'"
)

# Define shell themes
SHELL_THEMES="
#Shell Themes
# To revert to default WSL Theme, simply comment out the PS1 variable and source ~/.bashrc

#User@host removed and current dir colour green
#PS1='\[\033[01;32m\]\w\[\033[00m\] \$ '

#User@host removed and current dir blue box white text, commands appear on line2 (Default set by WSL-DEV) 
PS1='\[\033[44m\033[97m \w \033[0m\]\n\$ '

#User@host removed and current dir colour green, commands appear on line2
#PS1='\[\033[01;32m\]\w\[\033[00m\]\n\$'

#ADD YOUR THEMES BELLOW THIS LINE
#PS1=
"


# Define your Secrets
SECRETS_FILES=(
    "inventory.ini"
    "vault_server"
    "vault_token"
)


# Define secrets dir
export SECRETES_DIR="$HOME/.secrets"
# Define extra dirs to be created
export DIRECTORIES=(
    "$HOME/repos"
    "$HOME/.ssh"
    "$HOME/temp"
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