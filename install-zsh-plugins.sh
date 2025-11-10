#!/bin/bash

set -e

# Install zsh plugins and tools
echo "Installing zsh plugins and tools..."
yay -S --noconfirm --needed zsh-autosuggestions zsh-syntax-highlighting zsh-completions zsh-history-substring-search bat

# Verify plugin installations
if [ ! -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    echo "zsh-autosuggestions installation failed."
    exit 1
fi

if [ ! -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    echo "zsh-syntax-highlighting installation failed."
    exit 1
fi

if [ ! -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
    echo "zsh-history-substring-search installation failed."
    exit 1
fi

# Verify bat installation
if ! command -v bat &>/dev/null; then
    echo "bat installation failed."
    exit 1
fi

echo "zsh plugins and tools installed successfully!"
