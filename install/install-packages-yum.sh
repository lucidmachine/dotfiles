#! /usr/bin/env bash
#
# Install packages via yum.
#
# Synopsis
#   install-packages-yum.sh
#
# Examples
#   install-packages-yum.sh

set -euo pipefail


echo "################################################################################"
echo "# Installing Packages via yum"
echo "################################################################################"

sudo yum install --assumeyes \
  bash \
  ctags \
  curl \
  btop \
  git \
  jq \
  less \
  make \
  neovim \
  shellcheck \
  tmux \
  tree \
  wget \
  zsh
