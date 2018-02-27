#!/usr/bin/env bash 

# Close any open System Preferences panes
osascript -e 'tell application "System Preferences" to quit'

sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


###############################################################################
# General UI/UX                                                               #
###############################################################################

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false


###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40


###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"


###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Finder: show hidden files by default 
defaults write com.apple.finder AppleShowAllFiles -bool true 
 
# Finder: show all filename extensions 
defaults write NSGlobalDomain AppleShowAllExtensions -bool true 
 
# Finder: show status bar 
defaults write com.apple.finder ShowStatusBar -bool true 
 
# Finder: show path bar 
defaults write com.apple.finder ShowPathbar -bool true 
 
# Keep folders on top when sorting by name 
defaults write com.apple.finder _FXSortFoldersFirst -bool true 
 
# Avoid creating .DS_Store files on network or USB volumes 
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true 
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true 
 
############################################################################### 
# Safari & WebKit                                                             # 
############################################################################### 
 
# Privacy: don’t send search queries to Apple 
defaults write com.apple.Safari UniversalSearchEnabled -bool false 
defaults write com.apple.Safari SuppressSearchSuggestions -bool true 
 
# Press Tab to highlight each item on a web page 
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true 
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true 
 
# Show the full URL in the address bar (note: this still hides the scheme) 
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true 
 
# Set Safari’s home page to `about:blank` for faster loading 
defaults write com.apple.Safari HomePage -string "about:blank" 
 
# Prevent Safari from opening ‘safe’ files automatically after downloading 
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false 
 
# Hide Safari’s sidebar in Top Sites 
defaults write com.apple.Safari ShowSidebarInTopSites -bool false 
 
# Enable Safari’s debug menu 
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true 
 
# Enable the Develop menu and the Web Inspector in Safari 
defaults write com.apple.Safari IncludeDevelopMenu -bool true 
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true 
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true 
 
# Disable AutoFill 
defaults write com.apple.Safari AutoFillFromAddressBook -bool false 
defaults write com.apple.Safari AutoFillPasswords -bool false 
defaults write com.apple.Safari AutoFillCreditCardData -bool false 
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false 
 
# Warn about fraudulent websites 
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true 
 
# Disable plug-ins 
defaults write com.apple.Safari WebKitPluginsEnabled -bool false 
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false 
 
# Disable Java 
defaults write com.apple.Safari WebKitJavaEnabled -bool false 
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false 
 
# Block pop-up windows 
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false 
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false 
 
# Enable “Do Not Track” 
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true 
 
############################################################################### 
# Activity Monitor                                                            # 
############################################################################### 
 
# Show the main window when launching Activity Monitor 
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true 
 
# Visualize CPU usage in the Activity Monitor Dock icon 
defaults write com.apple.ActivityMonitor IconType -int 5 
 
# Show all processes in Activity Monitor 
defaults write com.apple.ActivityMonitor ShowCategory -int 0 
 
# Sort Activity Monitor results by CPU usage 
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage" 
defaults write com.apple.ActivityMonitor SortDirection -int 0 
