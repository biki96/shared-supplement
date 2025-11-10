#!/bin/bash

ORIGINAL_DIR=$(pwd)
REPO_URL="https://github.com/biki96/shared-dotfiles.git"
REPO_NAME="shared-dotfiles"

is_stow_installed() {
    pacman -Qi "stow" &>/dev/null
}

if ! is_stow_installed; then
    echo "Install stow first"
    exit 1
fi

cd ~

# Check if the repository already exists
if [ -d "$REPO_NAME" ]; then
    echo "Repository '$REPO_NAME' already exists. Skipping clone"
else
    if ! git clone "$REPO_URL"; then
        echo "Failed to clone the repository."
        exit 1
    fi
fi

echo "Removing old configs"
rm -rf ~/.config/nvim \
       ~/.config/starship.toml \
       ~/.local/share/nvim \
       ~/.cache/nvim

cd "$REPO_NAME"

stow ghostty
stow tmux
stow nvim
stow starship

