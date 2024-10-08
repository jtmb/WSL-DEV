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
- [Getting Started with the GUI Launcher](#getting-started-with-the-gui-launcher) 
- [Using custom commands](#using-custom-commands)
- [Environment Variables Explained](#environment-variables-explained)
- [Contributing](#contributing)
- [License](#license)

</details>
<br>

---  
## Prerequisites
- WSL Installed with atleast Ubuntu 22.04

### Getting Started with the GUI Launcher

( *Make sure to set your vars in vars.sh* )

Run the launcher and select the row value you wish to run.
```shell
./launcher.sh
```

![alt text](src/image.png)

### Using custom commands
The launcher calls modules from ./setup.sh, you can do this as well if you want to integrate this with your own automation pipeline. 

For example:


```shell
./setup.sh install_all
```

or run a several specific modules:
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
```shell
# Define versions and packages
ANSIBLE_VERSION="2.16"
PACKAGES=("jq" "net-tools" "zip")
TERRAFORM_VERSION="1.4.0"
VAULT_VERSION="1.13.0"

```  

```shell
# Define where secrets and repos locations will be
export secrets_dir="$HOME/.secrets"
export repos_dir="$HOME/.repos"
```

```shell
# Set custom aliases
ALIASES=(
    "alias ll='ls -la'" #example
    "alias wsl='cd /WSL-DEV && bash setup.sh'" 
)
```

```shell
# Create secrets files
SECRETS_FILES=(
    "inventory.ini"
    "vault_server"
    "vault_token"
)
```   

```  shell
# Define permissions and file patterns
PERMISSIONS_CONFIG=(
    "$HOME/.ssh 700"
    "$HOME/.ssh/id_* 600"
    "$HOME/.secrets 700"
    "$HOME/.repos 700"
)
```
```shell
#Define shell themes
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
```  
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

