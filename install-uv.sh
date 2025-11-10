#!/bin/bash

set -e

# Install uv (fast Python package manager)
echo "Installing uv..."

# Check if curl is available
if ! command -v curl &>/dev/null; then
    echo "Error: curl is required but not installed."
    echo "Please install curl first: sudo pacman -S curl"
    exit 1
fi

# Check if uv is already installed
if command -v uv &>/dev/null; then
    echo "uv is already installed. Updating..."
    uv self update
else
    echo "Installing uv via standalone installer..."
    curl -LsSf https://astral.sh/uv/install.sh | sh

    # Add uv to PATH for current session
    export PATH="$HOME/.cargo/bin:$PATH"

    echo "uv installed to ~/.cargo/bin/"
fi

# Verify installation
if command -v uv &>/dev/null; then
    echo "✓ uv installed successfully!"
    uv --version
elif [ -f "$HOME/.cargo/bin/uv" ]; then
    echo "✓ uv installed at ~/.cargo/bin/uv"
    "$HOME/.cargo/bin/uv" --version
    echo ""
    echo "⚠️  Please restart your shell or run:"
    echo "    source ~/.bashrc  # or source ~/.zshrc"
    echo "    export PATH=\"\$HOME/.cargo/bin:\$PATH\""
else
    echo "✗ uv installation failed."
    echo "Please check the error messages above."
    exit 1
fi
