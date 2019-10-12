#!/usr/bin/env bash

function setup() {
  sudo -v

  # Keep-alive: update existing `sudo` time stamp until the script has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

  # Run sections based on command line arguments
  for ARG in "$@"
  do
    if [ $ARG == "brew" ] || [ $ARG == "all" ]; then
      # Run the brew.sh Script # For a full listing of installed formulae and apps, refer to
      # the commented brew.sh source file directly and tweak it to
      # suit your needs.
      echo ""
      echo "------------------------------"
      echo "Installing Homebrew along with some common formulae and apps."
      echo "This might awhile to complete, as some formulae need to be installed from source."
      echo "------------------------------"
      echo ""
      source ./brew.sh
    fi
    if [ $ARG == "macos" ] || [ $ARG == "all" ]; then
      # Run the macos.sh Script
      # I strongly suggest you read through the commented osx.sh
      # source file and tweak any settings based on your personal
      # preferences. The script defaults are intended for you to
      # customize. For example, if you are not running an SSD you
      # might want to change some of the settings listed in the
      # SSD section.
      echo ""
      echo "------------------------------"
      echo "Setting sensible OSX defaults."
      echo "------------------------------"
      echo ""
      source ./macos.sh
    fi
  done
}


if [ $# -eq 0 ]; then
    echo ""
    echo "usage: ./setup [option]"
    echo "Options and arguments:"
    echo ""
    echo "+---------------------------------------------------------------------+"
    echo "| To install ALL packages run:                                        |"
    echo "|      ./setup all                                                    |"
    echo "+---------------------------------------------------------------------+"
    echo "| To install selected packagess run:                                  |"
    echo "|     ./setup brew macos                                              |"
    echo "+---------------------------------------------------------------------+"
    echo ""
    exit 1
fi

read -p "This script may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    setup $@
fi;
unset setup;

read -p "Restart your computer now? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo reboot now
fi;
