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

function rm_and_link() {
  local target_file="${1}"
  local link_name="${2}"

  if [ -d "${link_name}" ]; then
    echo "Removing directory ${link_name}"
    rm -r "${link_name}"

  elif [ -f "${link_name}" ]; then
    echo "Removing file ${link_name}"
    rm "${link_name}"

  else
    echo "Creating file ${link_name}"

  fi
 
  # -s - Symbolic link
  # -f - If the link already exists, overwrite it
  # -v - Verbose output
  ln -sfv "${target_file}" "${link_name}"
}

# Set vars
BASEDIR="$(git rev-parse --show-toplevel)"
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
rm_and_link "${BASEDIR}/alacritty"              "${XDG_CONFIG_HOME}/alacritty"
rm_and_link "${BASEDIR}/bash/palette"           "${HOME}/.palette"
rm_and_link "${BASEDIR}/bash/rc"                "${HOME}/.bashrc"
rm_and_link "${BASEDIR}/clojure"                "${XDG_CONFIG_HOME}/clojure"
rm_and_link "${BASEDIR}/git"                    "${XDG_CONFIG_HOME}/git"
rm_and_link "${BASEDIR}/git/git-sh-prompt"      "${HOME}/.git-prompt.sh"
rm_and_link "${BASEDIR}/intellij/ideavimrc"     "${HOME}/.ideavimrc"
rm_and_link "${BASEDIR}/kitty"                  "${XDG_CONFIG_HOME}/kitty"
rm_and_link "${BASEDIR}/neovim"                 "${XDG_CONFIG_HOME}/nvim"
rm_and_link "${BASEDIR}/ranger"                 "${XDG_CONFIG_HOME}/ranger"
rm_and_link "${BASEDIR}/skhd"                   "${XDG_CONFIG_HOME}/skhd"
rm_and_link "${BASEDIR}/sh/aliases"             "${HOME}/.aliases"
rm_and_link "${BASEDIR}/sh/environment"         "${HOME}/.environment"
rm_and_link "${BASEDIR}/sh/environment"         "${HOME}/.zshenv"
rm_and_link "${BASEDIR}/sway"                   "${XDG_CONFIG_HOME}/sway"
rm_and_link "${BASEDIR}/tmux/tmux.conf"         "${HOME}/.tmux.conf"
rm_and_link "${BASEDIR}/vim/vimrc"              "${HOME}/.vimrc"
rm_and_link "${BASEDIR}/vscodium/settings.json" "${XDG_CONFIG_HOME}/VSCodium/User/settings.json"
rm_and_link "${BASEDIR}/waybar"                 "${XDG_CONFIG_HOME}/waybar"
rm_and_link "${BASEDIR}/x11/Xresources"         "${HOME}/.Xresources"
rm_and_link "${BASEDIR}/zsh/rc"                 "${HOME}/.zshrc"
