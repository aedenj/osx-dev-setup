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
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" iterm2

# Java11 is needed by the scala metals plugin for vscode
brew cask install --appdir="~/Applications" java11

brew cask install --appdir="/Applications" docker
brew cask install --appdir="/Applications" anaconda
brew cask install --appdir="/Applications" wireshark
brew cask install --appdir="/Applications" slack

brew cask install --appdir="/Applications" tor-browser

brew cask install --appdir="/Applications" visual-studio-code
code --install-extension vscodevim.vim
code --install-extension ms-vscode.Go
code --install-extension ms-vscode-remote.remote-containers
code --install-extension scalameta.metals
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider
defaults delete -g ApplePressAndHoldEnabled # If necessary, reset global default

brew install bash-completion@2
brew link --overwrite bash-completion@2

brew install ack
brew install git
brew install git-extras
brew install bash-git-prompt
brew install jq
brew install cmake macvim
brew install minikube

brew install kubernetes-cli
brew link --overwrite kubernetes-cli

brew install docker-completion
brew install docker-compose-completion

# Password management
brew cask install --appdir="/Applications" 1password
brew cask install 1password-cli

# Remove outdated versions from the cellar.
brew cleanup
