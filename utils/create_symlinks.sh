#!/bin/sh

# Description: Creates / Updates symbolic links for my dotfiles

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Links

## Wezterm
ln -sfn "$BASE_DIR/wezterm/wezterm.lua" ~/.wezterm.lua
## Fish
ln -sfn "$BASE_DIR/fish/" ~/.config/fish
## Starship
ln -sfn "$BASE_DIR/starship/starship.toml" ~/.config/starship.toml
## NeoVim
ln -sfn "$BASE_DIR/nvim/" ~/.config/nvim

# Confirm
echo "Symbolic links created."

