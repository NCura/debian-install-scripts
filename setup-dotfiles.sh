#!/bin/bash

# Define source directory
dotfiles_dir="$HOME/.local/share/ncura/dotfiles"

# Ensure the dotfiles directory exists
if [ ! -d "$dotfiles_dir" ]; then
    echo "Dotfiles directory not found: $dotfiles_dir"
    exit 1
fi

# Symlink .bashrc, .bash_profile, .xinitrc to home directory
ln -sf "$dotfiles_dir/.bashrc" "$HOME/.bashrc"
ln -sf "$dotfiles_dir/.bash_profile" "$HOME/.bash_profile"
ln -sf "$dotfiles_dir/.xinitrc" "$HOME/.xinitrc"

# Create .config directory if it does not exist
mkdir -p "$HOME/.config"

# Symlink individual config directories and files
ln -sf "$dotfiles_dir/.config/kitty" "$HOME/.config/kitty"
ln -sf "$dotfiles_dir/.config/nvim" "$HOME/.config/nvim"
ln -sf "$dotfiles_dir/.config/qtile" "$HOME/.config/qtile"
ln -sf "$dotfiles_dir/.config/ranger" "$HOME/.config/ranger"
ln -sf "$dotfiles_dir/.config/x11" "$HOME/.config/x11"
ln -sf "$dotfiles_dir/.config/aliasrc" "$HOME/.config/aliasrc"

# Copy .local/bin, .local/share/wallpapers, .local/share/fonts
mkdir -p "$HOME/.local/bin"
cp -r "$dotfiles_dir/.local/bin/"* "$HOME/.local/bin/"

mkdir -p "$HOME/.local/share/wallpapers"
cp -r "$dotfiles_dir/.local/share/wallpapers/"* "$HOME/.local/share/wallpapers/"

mkdir -p "$HOME/.local/share/fonts"
cp -r "$dotfiles_dir/.local/share/fonts/"* "$HOME/.local/share/fonts/"

echo "Dotfiles symlink setup complete."
