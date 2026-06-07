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
  less \
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
  ttf-font-awesome \
  ttf-jetbrains-mono \
  ttf-jetbrains-mono-nerd \
  ueberzugpp \
  vdirsyncer \
  wget \
  zoxide \
  zsh
