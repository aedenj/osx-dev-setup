#!/usr/bin/env bash
#
set -e

# Install all the app store apps
#
# Ask for the administrator password upfront
sudo -v

mas install 1569813296
mas install 409203825

