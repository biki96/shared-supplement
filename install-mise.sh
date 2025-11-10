#!/bin/bash

set -e

# Install mise (polyglot runtime manager)
echo "Installing mise..."

# Install or update mise via AUR
echo "Installing/updating mise via AUR..."
yay -S --noconfirm --needed mise

# Verify installation
if ! command -v mise &>/dev/null; then
    echo "mise installation failed."
    exit 1
fi

echo "mise installed successfully!"
mise --version

# Configure mise to use uv for Python
echo "Configuring mise to use uv for Python..."
mkdir -p ~/.config/mise

# Create mise config that integrates with uv
cat > ~/.config/mise/config.toml <<'EOF'
# mise configuration

# Use uv for Python installations (faster, better)
[tools]
# Python installations will use precompiled binaries (no compilation)

[settings]
# Disable Python compilation (use prebuilt binaries)
python_compile = false

# Enable experimental features
experimental = true
EOF

echo "mise configured to work with uv!"
