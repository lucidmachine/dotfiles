#! /usr/bin/env bash
#
# Installs VSCodium extensions listed in vscodium/extensions.txt
#
# Synopsis
#   install-extensions-vscodium.sh
#
# Examples
#   install-extensions-vscodium.sh

cat vscodium/extensions.txt \
    | while read ext; do
        codium --install-extension "${ext}" --force
    done