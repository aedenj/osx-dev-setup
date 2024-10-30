#!/usr/bin/env bash
#
set -e

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront. for coreutils
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java latest:temurin-11
asdf install java latest:temurin-20
asdf global java latest:temurin-20


asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf install terraform latest
asdf global terraform latest


asdf plugin-add terragrunt
asdf install terragrunt latest
asdf global terragrunt latest
