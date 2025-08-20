#! /usr/bin/env bash
#
# Installs packages via pamac.
#
# Synopsis
#   install-packages-pamac.sh
#
# Examples
#   install-packages-pamac.sh

set -euo pipefail


echo "################################################################################"
echo "# Installing Packages via pamac"
echo "################################################################################"

sudo pamac install --no-confirm \
  alacritty \
  babashka-bin \
  bat \
  bash \
  bash-language-server \
  clojure \
  clojure-lsp-bin \
  clj-kondo-bin \
  curl \
  ctags \
  d2 \
  dart-sass \
  fd \
  firefox \
  fzf \
  git \
  htop \
  jdtls \
  jq \
  less \
  lua-language-server \
  luarocks \
  make \
  marksman \
  neovim \
  ranger \
  ripgrep \
  shellcheck \
  tmux \
  trash-cli \
  tree \
  ttf-font-awesome \
  ttf-jetbrains-mono \
  typescript-language-server \
  ueberzugpp \
  vscodium-bin \
  wget \
  zoxide \
  zsh
