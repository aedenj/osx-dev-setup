# ############################################################################################### 
# Warning!!!       This script required few times of entering password 
# 
# ############################################################################################### 
 
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
brew tap caskroom/versions

# Development tools 
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="~/Applications" java
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" docker
brew install ack
brew install git
brew install jq

# Fun
brew cask install --appdir="/Applications" cockatrice
brew cask install --appdir="/Applications" evernote

# Password management
brew cask install --appdir="/Applications" 1password

# Remove outdated versions from the cellar. 
brew cleanup 
