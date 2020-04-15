#!/usr/bin/env bash

# Installs configuration files, packages, and plugins
set -e

function link() {
  local target_file="${1}"
  local link_name="${2}"

  # -s - Symbolic link
  # -f - If the link already exists, overwrite it
  # -v - Verbose output
  ln -sfv ${target_file} ${link_name}
}

# Set vars
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlinks
echo "###########################"
echo "# Creating Symlinks"
echo "###########################"
link "${BASEDIR}/bash/bash_aliases" "${HOME}/.bash_aliases"
link "${BASEDIR}/bash/bashrc"       "${HOME}/.bashrc"
link "${BASEDIR}/bash/palette"      "${HOME}/.palette"
link "${BASEDIR}/bash/profile"      "${HOME}/.profile"
link "${BASEDIR}/git/gitignore"     "${HOME}/.gitignore"
link "${BASEDIR}/git/git-sh-prompt" "${HOME}/.git-prompt.sh"
link "${BASEDIR}/neovim"            "${HOME}/.config/nvim"

# Packages
echo
echo "###########################"
echo "# Installing Packages"
echo "###########################"
if [ $(which apt-get) ]; then
  sudo apt-get install -y \
    bash \
    curl \
    exuberant-ctags \
    git \
    htop \
    less \
    make \
    neovim \
    ranger \
    ripgrep \
    tmux \
    tree \
    wget
elif [ $(which brew) ]; then
  brew install \
    bash \
    clojure/tools/clojure \
    ctags \
    curl \
    git \
    htop \
    less \
    make \
    neovim \
    ranger \
    ripgrep \
    tmux \
    tree \
    wget

  brew cask install \
    iterm2
fi

# Neovim Plugins
echo
echo "###########################"
echo "# Installing Neovim Plugins"
echo "###########################"
#nvim +PlugInstall +qall
