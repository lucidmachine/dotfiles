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
dir "${HOME}/.n"
dir "${HOME}/.n/bin"
dir "${HOME}/bin"
dir "${HOME}/src"


# Symlinks
echo
echo "###########################"
echo "# Creating Symlinks"
echo "###########################"
link "${BASEDIR}/alacritty"           "${HOME}/.config/alacritty"
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
link "${BASEDIR}/skhd"                "${HOME}/.config/skhd"
link "${BASEDIR}/sh/aliases"          "${HOME}/.aliases"
link "${BASEDIR}/sh/environment"      "${HOME}/.environment"
link "${BASEDIR}/sh/environment"      "${HOME}/.zshenv"
link "${BASEDIR}/tmux/tmux.conf"      "${HOME}/.tmux.conf"
link "${BASEDIR}/x11/Xresources"      "${HOME}/.Xresources"
link "${BASEDIR}/yabai"               "${HOME}/.config/yabai"
link "${BASEDIR}/zsh/rc"              "${HOME}/.zshrc"

# Packages
echo
echo "###########################"
echo "# Installing Packages"
echo "###########################"
if ! command -v node &> /dev/null; then
  curl --location https://raw.githubusercontent.com/tj/n/master/bin/n \
    --output ${HOME}/.n/bin/n
  chmod 755 ${HOME}/.n/bin/n
  bash ${HOME}/.n/bin/n lts
fi

if command -v pamac &> /dev/null; then
  sudo pamac install --no-confirm \
    alacritty \
    babashka-bin \
    bash \
    clojure-lsp-bin \
    clj-kondo-bin \
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
    shellcheck \
    tmux \
    tree \
    wget \
    zoxide-bin \
    zsh
elif command -v apt-get &> /dev/null; then
  sudo apt-get install -y \
    alacritty \
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
  brew cask upgrade

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
    fzf \
    git \
    htop \
    koekeishiya/formulae/skhd \
    koekeishiya/formulae/yabai \
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
elif command -v yum &> /dev/null; then
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
elif command -v vim &> vim; then
  echo "Installing plugins in vim"
  vim +PlugInstall +qall
else
  echo "Unable to locate editor"
fi

