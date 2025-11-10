#!/bin/bash

set -e

# Install eza (modern ls replacement)
echo "Installing eza..."
yay -S --noconfirm --needed eza

# Verify installation
if ! command -v eza &>/dev/null; then
    echo "eza installation failed."
    exit 1
fi

echo "eza installed successfully!"
eza --version
