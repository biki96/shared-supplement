#!/bin/bash

set -e

# Install all packages in order
./install-zsh.sh
./install-zsh-plugins.sh
#./install-asdf.sh
#./install-nodejs.sh

./install-ghostty.sh
./install-stow.sh
./install-vscode.sh
./install-brave-nightly-bin.sh
./install-tmux.sh
./install-claude-code.sh
./install-claude-desktop.sh

./install-dotfiles.sh
./install-hyprland-overrides.sh
./set-shell.sh
