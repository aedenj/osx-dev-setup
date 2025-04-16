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

asdf plugin add awscli https://github.com/MetricMike/asdf-awscli.git
asdf install awscli latest
asdf global awscli latest

asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf install terraform latest
asdf global terraform latest

asdf plugin-add terragrunt
asdf install terragrunt latest
asdf global terragrunt latest

asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git
asdf install helm latest
asdf global helm latest

asdf plugin-add skaffold https://github.com/virtualstaticvoid/asdf-skaffold.git
asdf install skaffold latest
asdf global skaffold latest

asdf plugin-add aws-nuke https://github.com/bersalazar/asdf-aws-nuke.git
asdf install aws-nuke latest
asdf global aws-nuke latest

asdf plugin-add github-cli https://github.com/bartlomiejdanek/asdf-github-cli.git
asdf install github-cli latest
asdf global github-cli latest
