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
  ast-grep \
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
  markdownlint-cli2 \
  make \
  neovim \
  prettierd \
  python-neovim \
  python-pip \
  ranger \
  ripgrep \
  rust-analyzer \
  rustup \
  shellcheck \
  sqlfluff \
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
