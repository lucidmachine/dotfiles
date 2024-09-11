#! /usr/bin/env bash
#
# Installs the user's packages.
#
# Synopsis
#   install-packages.sh
#
# Arguments
#   PACKAGE_GROUP   Names of one or more groups of packages to install. Options include 'node', 'pamac',
#                   'brew', and 'yum'. If none are specified, then a best guess will be made.
#
# Examples
#   install-packages.sh
#   install-packages.sh pamac
#   install-packages.sh node brew

set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install given package groups
if [[ $# -gt 0 ]]; then
  for package_group in "${@}"; do
    package_group_script="install-packages-${package_group}.sh"
    "${SCRIPT_DIR}/${package_group_script}"
  done

  exit 0
fi


# Install detected package groups
"${SCRIPT_DIR}/install-packages-node.sh"

if command -v pamac &> /dev/null; then
  "${SCRIPT_DIR}/install-packages-pamac.sh"

elif command -v brew &> /dev/null; then
  "${SCRIPT_DIR}/install-packages-brew.sh"

elif command -v yum &> /dev/null && sudo -v &> /dev/null; then
  "${SCRIPT_DIR}/install-packages-yum.sh"

fi

