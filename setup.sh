#!/bin/bash

set -e

# Install requirements
sudo apt install -y \
    ripgrep \
    fzf \
    fd-find \
    curl \
    python3-pip

# Install JetBrainsMono Nerd Font
FONT_NAME="JetBrainsMono"
FONT_CHECK_NAME="JetBrainsMono Nerd Font"
FONT_VERSION="v3.4.0"
DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/${FONT_VERSION}/${FONT_NAME}.zip"

# Check if the font is already installed
if fc-list | grep -q "$FONT_CHECK_NAME"; then
    echo "✅ $FONT_CHECK_NAME is already installed. Skipping."
else
    FONT_DIR="$HOME/.local/share/fonts"
    mkdir -p "$FONT_DIR"
    TEMP_ZIP=$(mktemp)
    curl -fL "$DOWNLOAD_URL" -o "$TEMP_ZIP"
    unzip -o "$TEMP_ZIP" -d "$FONT_DIR"
    rm "$TEMP_ZIP"
    fc-cache -fv
fi

# Install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 24
nvm alias default 24

# Nvim configuration setup
PATH_NVIM="$HOME/.config/nvim"

# Remove existing config
if [ -d "$PATH_NVIM" ]; then
    rm -Rf "$PATH_NVIM"
fi

mkdir -p "$PATH_NVIM"
cp -r . "$PATH_NVIM"

rm -Rf "$HOME/.local/share/nvim/"
rm -Rf "$HOME/.cache/nvim/"

echo "✅ suscessfully installed nvim configuration."
