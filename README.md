<h1 align="center">
  <a href="https://github.com/jtmb">
    <img src="https://upload.wikimedia.org/wikipedia/commons/b/b3/Terminalicon2.png" alt="Logo" width="140" height="125">
  </a>
</h1>

<div align="center">
  <b>WSL-DEV</b> - A DevOps focused install script for ubuntu WSL.
  <br />
  <br />
  <a href="https://github.com/jtmb/retropie/issues/new?assignees=&labels=bug&title=bug%3A+">Report a Bug</a>
</div>
<br>
<details open="open">
<summary>Table of Contents</summary>


- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started) 
- [Environment Variables Explained](#environment-variables-explained)
- [Contributing](#contributing)
- [License](#license)

</details>
<br>

---  
## Prerequisites
- WSL Installed with atleast Ubuntu 22.04

### Getting Started

A simple run command gets your instance running:

( *Make sure to set your vars in vars.sh* )
```shell
./setup.sh install_all
```

or run a specific module:
```shell
./setup.sh \
    add_aliases \
    install_ansible \
    Install Terraform
```

## Environment Variables explained
```shell
# Set Git Creds

GIT_USER_EMAIL="your.email@gmail.com"
GIT_USER_NAME="username"
```  
text

```shell
# Define versions and packages
ANSIBLE_VERSION="2.16"
PACKAGES=("jq" "net-tools" "zip")
TERRAFORM_VERSION="1.4.0"
VAULT_VERSION="1.13.0"

```  
text

```shell
export secrets_dir="$HOME/.secrets"
export repos_dir="$HOME/.repos"
```
text

```shell
ALIASES=(
    "alias ll='ls -la'" #example
    "alias wsl='cd /WSL-DEV && bash setup.sh'" 
)
```
text

```shell
SECRETS_FILES=(
    "inventory.ini"
    "vault_server"
    "vault_token"
)
```   
text

```  shell
# Define permissions and file patterns
PERMISSIONS_CONFIG=(
    "$HOME/.ssh 700"
    "$HOME/.ssh/id_* 600"
    "$HOME/.secrets 700"
    "$HOME/.repos 700"
)
```
text  
## Contributing

First off, thanks for taking the time to contribute! Contributions are what makes the open-source community such an amazing place to learn, inspire, and create. Any contributions you make will benefit everybody else and are **greatly appreciated**.

Please try to create bug reports that are:

- _Reproducible._ Include steps to reproduce the problem.
- _Specific._ Include as much detail as possible: which version, what environment, etc.
- _Unique._ Do not duplicate existing opened issues.
- _Scoped to a Single Bug._ One bug per report.

## License

This project is licensed under the **GNU GENERAL PUBLIC LICENSE v3**. Feel free to edit and distribute this template as you like.

See [LICENSE](LICENSE) for more information. 

