#!/bin/bash

set -e

# Install zsh plugins
echo "Installing zsh plugins..."
yay -S --noconfirm --needed zsh-autosuggestions zsh-syntax-highlighting

# Verify installations
if [ ! -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    echo "zsh-autosuggestions installation failed."
    exit 1
fi

if [ ! -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    echo "zsh-syntax-highlighting installation failed."
    exit 1
fi

echo "zsh plugins installed successfully!"
