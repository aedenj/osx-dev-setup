#!/usr/bin/env bash
#
set -e

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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# ###############################################################################################
# Install Bash
# ###############################################################################################
brew install bash

# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"

# Prompts for password
sudo bash -c 'echo /opt/homebrew/bin/bash >> /etc/shells'

# Change to the new shell, prompts for password
chsh -s /opt/homebrew/bin/bash

# ###############################################################################################
# Install Cask
# ###############################################################################################
brew install cask
brew install brew-cask-completion


# Mac App Store CLI: https://github.com/mas-cli/mas
brew install mas

brew install ack
brew install git
brew install gh
brew install bash-git-prompt
brew install jq
brew install telnet
brew install csvkit
brew install --cask --appdir="/Applications" iterm2

brew install cmake cmake-docs
brew install macvim

# our version manager
brew install asdf

# Development tools
brew install --cask --appdir="/Applications" docker
brew install --cask --appdir="/Applications" wireshark
brew install --cask --appdir="/Applications" slack
brew install --cask --appdir="/Applications" discord
brew install --cask --appdir="/Applications" brave-browser
brew install --cask --appdir="/Applications" tor-browser
brew install --cask --appdir="/Applications" zoom
brew install --cask --appdir="/Applications" softraid
brew install --cask --appdir="/Applications" jdk-mission-control

brew install --cask --appdir="/Applications" intellij-idea
defaults write com.jetbrains.intellij.ce ApplePressAndHoldEnabled -bool false
defaults write -g ApplePressAndHoldEnabled 0
open -na "IntelliJ IDEA.app" --args installPlugins IdeaVIM
open -na "IntelliJ IDEA.app" --args installPlugins com.github.copilot
open -na "IntelliJ IDEA.app" --args installPlugins com.mallowigi
open -na "IntelliJ IDEA.app" --args installPlugins "String Manipulation"
open -na "IntelliJ IDEA.app" --args installPlugins org.intellij.plugins.hcl
open -na "IntelliJ IDEA.app" --args installPlugins name.kropp.intellij.makefile

sudo ln -s $OSXDEVSETUP_HOME/scripts/idea /usr/local/bin/idea

# javascript stuff
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

# Kafka Tools
brew install kcat

# Remove outdated versions from the cellar.
brew cleanup
