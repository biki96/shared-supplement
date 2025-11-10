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
    echo "Repository '$REPO_NAME' already exists. Pulling latest changes..."
    cd "$REPO_NAME"

    # Stash any local changes before pulling
    if ! git diff-index --quiet HEAD --; then
        echo "Stashing local changes..."
        git stash
    fi

    if ! git pull; then
        echo "Failed to pull latest changes. Continuing anyway..."
    fi
    cd ~
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

# Backup and remove existing configs that would conflict with stow
if [ -f ~/.config/ghostty/config ] && [ ! -L ~/.config/ghostty/config ]; then
    echo "Backing up existing ghostty config..."
    mv ~/.config/ghostty/config ~/.config/ghostty/config.backup-$(date +%Y%m%d-%H%M%S)
fi

cd "$REPO_NAME"

stow ghostty
stow tnux
stow nvim
stow starship
stow zshrc

