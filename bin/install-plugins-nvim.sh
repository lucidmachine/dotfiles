#! /usr/bin/env bash
#
# Installs the user's Neovim plugins.
#
# Synopsis
#   install-plugins-nvim.sh
#
# Examples
#   install-plugins-nvim.sh

set -euo pipefail

echo
echo "###########################"
echo "# Installing Editor Plugins"
echo "###########################"
if command -v nvim &> /dev/null; then
  echo "Installing plugins in nvim"
  nvim --headless +PlugInstall +qall
else
  echo "Unable to locate editor"
fi

