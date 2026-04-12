#! /usr/bin/env bash
#
# Installs packages via yay.
#
# Synopsis
#   install-packages-yay.sh
#
# Examples
#   install-packages-yay.sh


echo "################################################################################"
echo "# Installing Packages via yay"
echo "################################################################################"

yay -S --noconfirm  \
  alacritty \
  babashka-bin \
  bat \
  bash \
  btop \
  clojure \
  curl \
  d2 \
  dart-sass \
  fd \
  firefox \
  fzf \
  git \
  jq \
  khal \
  less \
  luarocks \
  make \
  neovim \
  ranger \
  ripgrep \
  shellcheck \
  tmux \
  trash-cli \
  tree \
  ttf-font-awesome \
  ttf-jetbrains-mono \
  ueberzugpp \
  vdirsyncer \
  wget \
  zoxide \
  zsh
