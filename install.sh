#! /usr/bin/env bash
#
# Installs and configures the user's software environment.
#
# Synopsis
#   install.sh [PACKAGE_GROUP...]
#
# Arguments
#   PACKAGE_GROUP   Names of one or more groups of packages to install. Options include 'node', 'pamac',
#                   'brew', and 'yum'. If none are specified, then a best guess will be made.
#
# Examples
#   install.sh
#   install.sh pamac
#   install.sh node brew

set -euo pipefail

bin/install-skeleton.sh
echo
bin/install-packages.sh
echo
bin/install-plugins-nvim.sh
