#!/bin/bash

set -e

# Install uv (fast Python package manager)
echo "Installing uv..."

# Check if uv is already installed
if command -v uv &>/dev/null; then
    echo "uv is already installed. Updating..."
    uv self update
else
    echo "Installing uv via standalone installer..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi

# Verify installation
if ! command -v uv &>/dev/null; then
    echo "uv installation failed."
    exit 1
fi

echo "uv installed successfully!"
uv --version
