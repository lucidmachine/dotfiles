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
  btop \
  clojure \
  curl \
  ctags \
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
  python-aiohttp-oauthlib \
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
  vscodium-bin \
  wget \
  zoxide \
  zsh
