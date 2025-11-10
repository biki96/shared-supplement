#!/bin/sh

# Install all packages in order
./install-zsh.sh
#./install-asdf.sh
#./install-nodejs.sh

./install-ghostty.sh
./install-stow.sh
./install-vscode.sh
./install-brave-nightly-bin.sh 
./install-tmux.sh
./install-claude-code.sh

./install-dotfiles.sh
./install-hyprland-overrides.sh
#./set-shell.sh
