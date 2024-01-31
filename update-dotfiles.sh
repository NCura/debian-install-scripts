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

# Fetch latest commit information from remote
git fetch

# Get the latest commit hash of the remote main branch
remote_commit=$(git rev-parse origin/main)

# Get the latest commit hash of the local main branch
local_commit=$(git rev-parse main)

# Compare local and remote commits
if [ "$local_commit" != "$remote_commit" ]; then
    echo "Local and remote repositories are not in sync. Please pull changes before pushing."
    exit 1
fi

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
