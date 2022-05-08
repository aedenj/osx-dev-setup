#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront. for coreutils
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# ###############################################################################################
# Check for Homebrew,
# Install if we don't have it
# ###############################################################################################

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# ###############################################################################################
# Install Bash 4.
# ###############################################################################################
brew install bash
brew tap homebrew/core

# ###############################################################################################
# bash-completion2
# Warning!!!       bash-completion2 have refrences in ~/.bash_profile  file
#                  by defaults:
#                              lines 45-68 in .bash_profile are comments out
#                              un comment them based on your needs
# ###############################################################################################
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"

# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'

# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# ###############################################################################################
# Install Cask
# ###############################################################################################
brew install cask
brew tap homebrew/cask-versions
brew install brew-cask-completion

# Development tools
brew install --cask --appdir="/Applications" alfred
brew install --cask --appdir="/Applications" iterm2

# Java11 is needed by the scala metals plugin for vscode
brew install --cask --appdir="~/Applications" java11
brew install --cask --appdir="~/Applications" jdk-mission-control

brew install --cask --appdir="/Applications" docker
brew install --cask --appdir="/Applications" anaconda
brew install --cask --appdir="/Applications" wireshark
brew install --cask --appdir="/Applications" slack

brew install --cask --appdir="/Applications" tor-browser
brew install --cask --appdir="/Applications" brave-browser

brew install --cask --appdir="/Applications" streamlabs-obs

brew install --cask --appdir="/Applications" visual-studio-code
code --install-extension --force vscodevim.vim
code --install-extension --force ms-vscode.Go
code --install-extension --force ms-vscode-remote.remote-containers
code --install-extension --force scalameta.metals
code --install-extension --force ms-kubernetes-tools.vscode-kubernetes-tools
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider
defaults delete -g ApplePressAndHoldEnabled # If necessary, reset global default

brew install --cask --appdir="/Applications" intellij-idea-ce
defaults write com.jetbrains.intellij.ce ApplePressAndHoldEnabled -bool false

brew install bash-completion@2
brew link --overwrite bash-completion@2

brew install ack
brew install git
brew install gh
brew install bash-git-prompt
brew install jq
brew install cmake macvim
brew install telnet
brew install csvkit


# needed mostly for coc.nvim
brew install nvm
mkdir ~/.nvm
nvm install node

curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

brew install minikube
brew install kubernetes-cli
brew link --overwrite kubernetes-cli
brew install helm

# Password management
brew install --cask --appdir="/Applications" 1password
brew install --cask 1password-cli

# Google
brew install --cask --appdir="/Applications" google-drive

# Kafka Tools
brew install kcat

# Remove outdated versions from the cellar.
brew cleanup
