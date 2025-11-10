#!/bin/bash

set -e

# Install electron25-bin first to avoid compiling electron from source
yay -S --noconfirm --needed electron25-bin

# Install claude-desktop
yay -S --noconfirm --needed claude-desktop
