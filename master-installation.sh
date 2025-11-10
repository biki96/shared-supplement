#!/bin/bash

# Master installation script
# Installs all tools and sets up workspace structure

echo "=========================================="
echo "  Master Installation Script"
echo "=========================================="
echo ""

# Track successes and failures
declare -a SUCCESSES
declare -a FAILURES

# Function to run installation script
run_install() {
    local script=$1
    local name=$2
    echo ""
    echo "→ Installing $name..."
    if ./"$script"; then
        SUCCESSES+=("✓ $name")
    else
        FAILURES+=("✗ $name")
        echo "⚠️  $name installation failed, continuing..."
    fi
}

# Check prerequisites
echo "Checking prerequisites..."
if ! command -v curl &>/dev/null; then
    echo "⚠️  curl not found. Some installations may fail."
    echo "   Install with: sudo pacman -S curl"
fi

if ! command -v git &>/dev/null; then
    echo "⚠️  git not found. Some installations may fail."
    echo "   Install with: sudo pacman -S git"
fi
echo ""

# Shell and tools
run_install "install-zsh.sh" "Zsh"
run_install "install-zsh-plugins.sh" "Zsh plugins"
run_install "install-eza.sh" "eza (modern ls)"
run_install "install-vivid.sh" "vivid (LS_COLORS)"

# Python tools
run_install "install-uv.sh" "uv (Python package manager)"
run_install "install-mise.sh" "mise (runtime manager)"

# Applications
run_install "install-ghostty.sh" "Ghostty terminal"
run_install "install-stow.sh" "GNU Stow"
run_install "install-vscode.sh" "VS Code"
run_install "install-brave-nightly-bin.sh" "Brave Browser"
run_install "install-tmux.sh" "tmux"
run_install "install-claude-code.sh" "Claude Code"
run_install "install-claude-desktop.sh" "Claude Desktop"

# Configuration
run_install "install-dotfiles.sh" "Dotfiles"
run_install "install-hyprland-overrides.sh" "Hyprland overrides"
run_install "set-shell.sh" "Set default shell"

# Workspace setup
echo ""
echo "→ Setting up workspace structure..."
if ./setup-workspace.sh; then
    SUCCESSES+=("✓ Workspace structure")
else
    FAILURES+=("✗ Workspace structure")
fi

# Summary
echo ""
echo "=========================================="
echo "  Installation Summary"
echo "=========================================="
echo ""

if [ ${#SUCCESSES[@]} -gt 0 ]; then
    echo "✅ Successful installations (${#SUCCESSES[@]}):"
    printf '%s\n' "${SUCCESSES[@]}"
    echo ""
fi

if [ ${#FAILURES[@]} -gt 0 ]; then
    echo "❌ Failed installations (${#FAILURES[@]}):"
    printf '%s\n' "${FAILURES[@]}"
    echo ""
    echo "Please check the error messages above and retry failed installations manually."
    echo ""
fi

echo "=========================================="
echo "Next steps:"
echo "  1. Restart your shell or run: source ~/.zshrc"
echo "  2. Verify installations: workspace list"
echo "  3. Configure tools as needed"
echo "=========================================="
