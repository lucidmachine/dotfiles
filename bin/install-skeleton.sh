#! /usr/bin/env bash
#
# Creates configuration directories and configuration file symlinks.
#
# Synopsis
#   install-skeleton.sh
#
# Examples
#   install-skeleton.sh

set -euo pipefail

function dir() {
  local target_dir="${1}"

  if [ -d "${target_dir}" ]; then
    echo "${target_dir} already exists. Skipping."
  elif [ -e "${target_dir}" ]; then
    echo "${target_dir} already exists, but is not a directory. Skipping."
  else
    # mkdir short flags used for macOS compatibility
    # -p - Create intermediate parent directories
    # -v - Verbose input
    mkdir -p -v "${target_dir}"
  fi
}

function link() {
  local target_file="${1}"
  local link_name="${2}"

  if [ -L "${link_name}" ]; then
    echo "${link_name} already exists. Skipping."
  elif [ -e "${link_name}" ]; then
    echo "${link_name} already exists, but is not a link. Skipping."
  else
    # -s - Symbolic link
    # -f - If the link already exists, overwrite it
    # -v - Verbose output
    ln -sfv "${target_file}" "${link_name}"
  fi
}

# Set vars
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"

# Directories
echo "################################################################################"
echo "# Creating Directories"
echo "################################################################################"
dir "${XDG_CONFIG_HOME}"
dir "${HOME}/.n"
dir "${HOME}/.n/bin"
dir "${HOME}/bin"
dir "${HOME}/src"


# Symlinks
echo
echo "################################################################################"
echo "# Creating Symlinks"
echo "################################################################################"
link "${BASEDIR}/alacritty"           "${XDG_CONFIG_HOME}/alacritty"
link "${BASEDIR}/bash/palette"        "${HOME}/.palette"
link "${BASEDIR}/bash/rc"             "${HOME}/.bashrc"
link "${BASEDIR}/clojure"             "${XDG_CONFIG_HOME}/clojure"
link "${BASEDIR}/git"                 "${XDG_CONFIG_HOME}/git"
link "${BASEDIR}/git/git-sh-prompt"   "${HOME}/.git-prompt.sh"
link "${BASEDIR}/intellij/ideavimrc"  "${HOME}/.ideavimrc"
link "${BASEDIR}/i3"                  "${XDG_CONFIG_HOME}/i3"
link "${BASEDIR}/i3status"            "${XDG_CONFIG_HOME}/i3status"
link "${BASEDIR}/kitty"               "${XDG_CONFIG_HOME}/kitty"
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
