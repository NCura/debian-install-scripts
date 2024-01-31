#!/bin/bash

# Define source directory
dotfiles_dir="$HOME/.local/share/ncura/dotfiles"

# Ensure the dotfiles directory exists
if [ ! -d "$dotfiles_dir" ]; then
    echo "Dotfiles directory not found: $dotfiles_dir"
    exit 1
fi

# Copy updated files from home directory to dotfiles directory
cp "$HOME/.bashrc" "$dotfiles_dir/"
cp "$HOME/.bash_profile" "$dotfiles_dir/"
cp "$HOME/.config/aliasrc" "$dotfiles_dir/.config/"
cp "$HOME/.config/kitty/kitty.conf" "$dotfiles_dir/.config/kitty/kitty.conf"
cp "$HOME/.config/qtile/config.py" "$dotfiles_dir/.config/qtile/config.py"
cp "$HOME/.config/x11/xprofile" "$dotfiles_dir/.config/x11/xprofile"

# Change to the dotfiles directory
cd "$dotfiles_dir"

# Check if SSH agent is running, start it if not
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)"
fi

# Add SSH key for GitHub, if not already added
ssh_key="$HOME/.ssh/github"
if ! ssh-add -l | grep -q "$ssh_key"; then
    ssh-add "$ssh_key"
fi

# Stage all changes
git add .

# Commit the changes with an optional custom message
commit_message="${1:-Updated dotfiles}"
git commit -m "$commit_message"

# Push the changes to GitHub
git push origin main

echo "Dotfiles updated and pushed to GitHub with message: $commit_message"
