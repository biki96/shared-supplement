#!/bin/bash

set -e

# Install vivid (LS_COLORS generator)
echo "Installing vivid..."
yay -S --noconfirm --needed vivid

# Verify installation
if ! command -v vivid &>/dev/null; then
    echo "vivid installation failed."
    exit 1
fi

echo "vivid installed successfully!"
vivid --version
