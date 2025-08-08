#! /usr/bin/env bash
#
# Installs packages via brew.
#
# Synopsis
#   install-packages-brew.sh
#
# Examples
#   install-packages-brew.sh

set -euo pipefail


echo "################################################################################"
echo "# Installing Packages via brew"
echo "################################################################################"

# brew errors when packages which are already installed have upgrades
# available, so we upgrade the universe before attempting to install
brew upgrade

brew install \
  amethyst \
  bash-language-server \
  borkdude/brew/babashka \
  borkdude/brew/clj-kondo \
  bash \
  bat \
  clojure/tools/clojure \
  clojure-lsp/brew/clojure-lsp-native \
  ctags \
  curl \
  d2 \
  fd \
  firefox \
  font-jetbrains-mono-nerd-font \
  fzf \
  git \
  htop \
  kitty \
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
  tree \
  typescript-language-server \
  vscodium \
  wget \
  zoxide \
  zsh
