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
link "${BASEDIR}/bash/aliases"        "${HOME}/.bash_aliases"
link "${BASEDIR}/bash/environment"    "${HOME}/.environment"
link "${BASEDIR}/bash/palette"        "${HOME}/.palette"
link "${BASEDIR}/bash/profile"        "${HOME}/.profile"
link "${BASEDIR}/bash/rc"             "${HOME}/.bashrc"
link "${BASEDIR}/git/gitignore"       "${HOME}/.gitignore"
link "${BASEDIR}/git/git-sh-prompt"   "${HOME}/.git-prompt.sh"
link "${BASEDIR}/neovim/"             "${HOME}/.config/nvim"
link "${BASEDIR}/neovim/"             "${HOME}/.vim"
link "${BASEDIR}/ranger/"             "${HOME}/.config/ranger"

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
  # brew errors when packages which are already installed have upgrades
  # available, so we upgrade the universe before attempting to install
  brew upgrade
  brew cask upgrade

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

# Editor Plugins
echo
echo "###########################"
echo "# Installing Editor Plugins"
echo "###########################"
if [ $(which nvim) ]; then
  nvim +PlugInstall +qall
elif [ $(which vim) ]; then
  vim +PlugInstall +qall
fi

