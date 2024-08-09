# Function to configure Git user email and name
configure_git() {
    echo "Configuring Git user email and name..."
    git config --global user.email "$GIT_USER_EMAIL"
    git config --global user.name "$GIT_USER_NAME"
    echo "Git configuration set successfully!"
}