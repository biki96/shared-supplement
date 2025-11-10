#!/bin/bash

set -e

# Install mise (polyglot runtime manager)
echo "Installing mise..."

# Check if yay is available
if ! command -v yay &>/dev/null; then
    echo "Error: yay (AUR helper) is required but not installed."
    echo "Please install yay first or install mise manually:"
    echo "  1. Install yay: https://github.com/Jguer/yay#installation"
    echo "  2. Or use: curl https://mise.run | sh"
    exit 1
fi

# Install or update mise via AUR
echo "Installing/updating mise via AUR..."
if ! yay -S --noconfirm --needed mise; then
    echo "✗ mise installation via yay failed."
    echo "Trying alternative installation method..."

    # Fallback to standalone installer
    if command -v curl &>/dev/null; then
        curl https://mise.run | sh
        export PATH="$HOME/.local/bin:$PATH"
    else
        echo "curl not available. Cannot install mise."
        exit 1
    fi
fi

# Verify installation
if command -v mise &>/dev/null; then
    echo "✓ mise installed successfully!"
    mise --version
elif [ -f "$HOME/.local/bin/mise" ]; then
    echo "✓ mise installed at ~/.local/bin/mise"
    "$HOME/.local/bin/mise" --version
    echo ""
    echo "⚠️  Please restart your shell or run:"
    echo "    export PATH=\"\$HOME/.local/bin:\$PATH\""
else
    echo "✗ mise installation failed."
    exit 1
fi

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
