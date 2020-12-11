#!/usr/bin/env bash

# Installs configuration files, packages, and plugins
set -e

function dir() {
  local target_dir="${1}"

  if [ -d ${target_dir} ]; then
    echo "${target_dir} already exists. Skipping."
  elif [ -e ${target_dir} ]; then
    echo "${target_dir} already exists, but is not a directory. Skipping."
  else
    mkdir --parents --verbose ${target_dir}
  fi
}

function link() {
  local target_file="${1}"
  local link_name="${2}"

  if [ -L ${link_name} ]; then
    echo "${link_name} already exists. Skipping."
  elif [ -e ${link_name} ]; then
    echo "${link_name} already exists, but is not a link. Skipping."
  else
    # -s - Symbolic link
    # -f - If the link already exists, overwrite it
    # -v - Verbose output
    ln -sfv ${target_file} ${link_name}
  fi
}

# Set vars
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Directories
echo "###########################"
echo "# Creating Directories"
echo "###########################"
dir "${HOME}/.config"


# Symlinks
echo
echo "###########################"
echo "# Creating Symlinks"
echo "###########################"
link "${BASEDIR}/bash/palette"        "${HOME}/.palette"
link "${BASEDIR}/bash/rc"             "${HOME}/.bashrc"
link "${BASEDIR}/git/gitignore"       "${HOME}/.gitignore"
link "${BASEDIR}/git/git-sh-prompt"   "${HOME}/.git-prompt.sh"
link "${BASEDIR}/intellij/ideavimrc"  "${HOME}/.ideavimrc"
link "${BASEDIR}/i3"                  "${HOME}/.config/i3"
link "${BASEDIR}/i3status"            "${HOME}/.config/i3status"
link "${BASEDIR}/neovim"              "${HOME}/.config/nvim"
link "${BASEDIR}/neovim"              "${HOME}/.vim"
link "${BASEDIR}/ranger"              "${HOME}/.config/ranger"
link "${BASEDIR}/sh/aliases"          "${HOME}/.aliases"
link "${BASEDIR}/sh/environment"      "${HOME}/.environment"
link "${BASEDIR}/sh/profile"          "${HOME}/.profile"
link "${BASEDIR}/tmux/tmux.conf"      "${HOME}/.tmux.conf"

# Packages
echo
echo "###########################"
echo "# Installing Packages"
echo "###########################"
if [ $(which pamac) ]; then
  sudo pamac install --no-confirm \
    bash \
    curl \
    ctags \
    fd \
    fzf \
    git \
    htop \
    jq \
    less \
    make \
    neovim \
    ranger \
    ripgrep \
    tmux \
    tree \
    wget
elif [ $(which apt-get) ]; then
  sudo apt-get install -y \
    bash \
    curl \
    exuberant-ctags \
    fd \
    fzf \
    git \
    htop \
    jq \
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
    fd \
    fzf \
    git \
    htop \
    jq \
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
  echo "Installing plugins in nvim"
  nvim +PlugInstall +qall
elif [ $(which vim) ]; then
  echo "Installing plugins in vim"
  vim +PlugInstall +qall
else
  echo "Unable to locate editor"
fi

