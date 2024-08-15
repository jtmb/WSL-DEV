shell_themes() {
    # Write themes to .bashrc
    {
        echo "# Shell Themes"
        echo
        echo "$SHELL_THEMES"
        echo
    } >> ~/.bashrc

    # Inform the user
    echo "Themes have been added to ~/.bashrc. Please source ~/.bashrc to apply changes."
}
