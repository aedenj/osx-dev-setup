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


# Remove outdated versions from the cellar. 
brew cleanup 