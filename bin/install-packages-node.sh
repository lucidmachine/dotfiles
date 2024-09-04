#! /usr/bin/env bash
#
# Installs NodeJS, a Node version manager N, and NPM packages.
#
# Synopsis
#   install-packages-node.sh
#
# Examples
#   install-packages-node.sh

set -euo pipefail


if ! command -v node &> /dev/null; then
  export N_PREFIX="${HOME}/.n"

  # Install n
  echo "################################################################################"
  echo "# Installing N"
  echo "################################################################################"

  curl --location https://raw.githubusercontent.com/tj/n/master/bin/n \
    --output "${N_PREFIX}/bin/n"
  chmod 755 "${N_PREFIX}/bin/n"

  echo

  # Install the latest Node.js LTS using n

  echo "################################################################################"
  echo "# Installing NodeJS LTS"
  echo "################################################################################"

  bash "${N_PREFIX}/bin/n" lts

  # Add node to the path for the rest of this script
  export PATH="${N_PREFIX}/bin:${PATH}"

  echo
fi

echo "################################################################################"
echo "# Installing packages via npm"
echo "################################################################################"
npm install --global \
  @angular/language-server \
  vim-language-server \
  vscode-langservers-extracted
