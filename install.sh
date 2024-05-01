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
    # mkdir short flags used for macOS compatibility
    # -p - Create intermediate parent directories
    # -v - Verbose input
    mkdir -p -v ${target_dir}
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
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"

# Directories
echo "###########################"
echo "# Creating Directories"
echo "###########################"
dir "${XDG_CONFIG_HOME}"
dir "${HOME}/.n"
dir "${HOME}/.n/bin"
dir "${HOME}/bin"
dir "${HOME}/src"


# Symlinks
echo
echo "###########################"
echo "# Creating Symlinks"
echo "###########################"
link "${BASEDIR}/alacritty"           "${XDG_CONFIG_HOME}/alacritty"
link "${BASEDIR}/bash/palette"        "${HOME}/.palette"
link "${BASEDIR}/bash/rc"             "${HOME}/.bashrc"
link "${BASEDIR}/clojure"             "${XDG_CONFIG_HOME}/clojure"
link "${BASEDIR}/git"                 "${XDG_CONFIG_HOME}/git"
link "${BASEDIR}/git/git-sh-prompt"   "${HOME}/.git-prompt.sh"
link "${BASEDIR}/intellij/ideavimrc"  "${HOME}/.ideavimrc"
link "${BASEDIR}/i3"                  "${XDG_CONFIG_HOME}/i3"
link "${BASEDIR}/i3status"            "${XDG_CONFIG_HOME}/i3status"
link "${BASEDIR}/neovim"              "${XDG_CONFIG_HOME}/nvim"
link "${BASEDIR}/ranger"              "${XDG_CONFIG_HOME}/ranger"
link "${BASEDIR}/skhd"                "${XDG_CONFIG_HOME}/skhd"
link "${BASEDIR}/sh/aliases"          "${HOME}/.aliases"
link "${BASEDIR}/sh/environment"      "${HOME}/.environment"
link "${BASEDIR}/sh/environment"      "${HOME}/.zshenv"
link "${BASEDIR}/sway"                "${XDG_CONFIG_HOME}/sway"
link "${BASEDIR}/tmux/tmux.conf"      "${HOME}/.tmux.conf"
link "${BASEDIR}/vim/vimrc"           "${HOME}/.vimrc"
link "${BASEDIR}/waybar"              "${XDG_CONFIG_HOME}/waybar"
link "${BASEDIR}/x11/Xresources"      "${HOME}/.Xresources"
link "${BASEDIR}/zsh/rc"              "${HOME}/.zshrc"

# Packages
echo
echo "###########################"
echo "# Installing Packages"
echo "###########################"
if ! command -v node &> /dev/null; then
  export N_PREFIX="${HOME}/.n"

  # Install n
  curl --location https://raw.githubusercontent.com/tj/n/master/bin/n \
    --output "${N_PREFIX}/bin/n"
  chmod 755 "${N_PREFIX}/bin/n"

  # Install the latest Node.js LTS using n
  bash "${N_PREFIX}/bin/n" lts

  # Add node to the path for the rest of this script. NeoVim's CoC plugin needs this
  export PATH="${N_PREFIX}/bin:${PATH}"
fi

if command -v pamac &> /dev/null; then
  sudo pamac install --no-confirm \
    alacritty \
    babashka-bin \
    bash \
    clojure \
    clojure-lsp-bin \
    clj-kondo-bin \
    curl \
    ctags \
    fd \
    firefox-developer-edition \
    fzf \
    git \
    htop \
    jq \
    less \
    make \
    neovim \
    ranger \
    ripgrep \
    shellcheck \
    tmux \
    tree \
    wget \
    zoxide \
    zsh

elif command -v brew &> /dev/null; then
  # brew errors when packages which are already installed have upgrades
  # available, so we upgrade the universe before attempting to install
  brew upgrade

  brew install \
    alacritty \
    borkdude/brew/babashka \
    borkdude/brew/clj-kondo \
    bash \
    clojure/tools/clojure \
    clojure-lsp/brew/clojure-lsp-native \
    ctags \
    curl \
    fd \
    firefox-developer-edition \
    fzf \
    git \
    htop \
    koekeishiya/formulae/skhd \
    jq \
    less \
    make \
    neovim \
    ranger \
    ripgrep \
    shellcheck \
    tmux \
    tree \
    wget \
    zoxide \
    zsh

  brew services start skhd

elif command -v yum &> /dev/null && sudo -v &> /dev/null; then
  sudo yum install --assumeyes \
    bash \
    ctags \
    curl \
    git \
    htop \
    jq \
    less \
    make \
    neovim \
    shellcheck \
    tmux \
    tree \
    wget \
    zsh
fi

# Editor Plugins
echo
echo "###########################"
echo "# Installing Editor Plugins"
echo "###########################"
if command -v nvim &> nvim; then
  echo "Installing plugins in nvim"
  nvim --headless +PlugInstall +CocInstall +qall
else
  echo "Unable to locate editor"
fi

