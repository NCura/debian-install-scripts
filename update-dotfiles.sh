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

# Stage all changes
git add .

# Commit the changes
git commit -m "Updated dotfiles"

# Push the changes to GitHub
git push origin main

echo "Dotfiles updated and pushed to GitHub."
