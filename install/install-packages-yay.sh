#! /usr/bin/env bash
#
# Installs packages via yay.
#
# Synopsis
#   install-packages-yay.sh
#
# Examples
#   install-packages-yay.sh

set -euo pipefail

echo "################################################################################"
echo "# Installing Packages via yay"
echo "################################################################################"

yay -S --noconfirm \
  babashka-bin \
  bash \
  bat \
  btop \
  clojure \
  curl \
  d2 \
  dart-sass \
  fd \
  fzf \
  git \
  jq \
  khal \
  lazygit \
  less \
  lua51 \
  luarocks \
  make \
  neovim \
  python-neovim \
  python-pip \
  ranger \
  ripgrep \
  rustup \
  shellcheck \
  tmux \
  trash-cli \
  tree \
  tree-sitter-cli \
  ttf-font-awesome \
  ttf-jetbrains-mono \
  ttf-jetbrains-mono-nerd \
  ueberzugpp \
  unzip \
  vdirsyncer \
  wget \
  zoxide \
  zsh
