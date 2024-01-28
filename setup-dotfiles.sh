#!/bin/bash

# Define source directory
dotfiles_dir="$HOME/.local/share/ncura/dotfiles"

# Ensure the dotfiles directory exists
if [ ! -d "$dotfiles_dir" ]; then
    echo "Dotfiles directory not found: $dotfiles_dir"
    exit 1
fi

# Change to the dotfiles directory
cd "$dotfiles_dir"

# Copy .bashrc to home directory
cat .bashrc > "$HOME/.bashrc"

# Copy .bash_profile to home directory
cp .bash_profile "$HOME/"

# Copy .xinitrc to home directory
cp .xinitrc "$HOME/"

# Copy .config directory
cp -r .config "$HOME/"

# Create directories if they do not exist and copy files
mkdir -p "$HOME/.local/bin"
cp -r .local/bin/* "$HOME/.local/bin/"

mkdir -p "$HOME/.local/share/wallpapers"
cp -r .local/share/wallpapers/* "$HOME/.local/share/wallpapers/"

mkdir -p "$HOME/.local/share/fonts"
cp -r .local/share/fonts/* "$HOME/.local/share/fonts/"

echo "Dotfiles setup complete."
