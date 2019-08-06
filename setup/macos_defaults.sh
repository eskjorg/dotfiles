#! /bin/bash

#https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/
#https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

############
## System ##
############

# Computer name
export MY_NAME="ZenMacBook"
sudo scutil --set ComputerName "$MY_NAME" && \
sudo scutil --set HostName "$MY_NAME" && \
sudo scutil --set LocalHostName "$MY_NAME" && \
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$MY_NAME"

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone "Europe/Stockholm" > /dev/null

###################
## Pref: General ##
###################


# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# Security
defaults write /Library/Preferences/com.apple.security GKAutoRearm -bool false
# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Login
# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
#Add a message to the login screen:
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Welcome to Eskil's Zenuity MacBook"
defaults write -g userMenuExtraStyle -int 2 # Show fast user switching menu as: icon

## Finder ##

# Show the Status Bar, this can also be toggled on the View menu:
defaults write com.apple.finder ShowStatusBar -bool true
# Start the status bar Path at $HOME (instead of Hard drive)
defaults write /Library/Preferences/com.apple.finder PathBarRootAtHome -bool

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# defaults write com.apple.finder CreateDesktop -bool FALSE
killall Finder
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Disable Resume system-wide
#defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

#Enable slow motion with shift key on QuickLook:
defaults write com.apple.finder QLEnableSlowMotion -boolean

#Disable creation of Metadata Files on Network Volumes (avoids creation of .DS_Store and AppleDouble files.)
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#Disable creation of Metadata Files on USB Volumes (avoids creation of .DS_Store and AppleDouble files.)
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

#Disable the warning when changing a file extension 
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#When performing a search, search the current folder by default (the default 'This Mac' is "SCev")
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

## Animations ##
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g QLPanelAnimationDuration -float 0
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.Dock autohide-delay -float 0
#mail
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

## Screenshots ##
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture “include-date” 0
defaults write com.apple.screencapture location $HOME/Downloads
killall SystemUIServer

##########
## Apps ##
##########

# App Store
defaults write com.apple.appstore ShowDebugMenu -bool true

# Safari
defaults write com.apple.safari WebKitDNSPrefetchingEnabled -boolean false
defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25

# TextEdit
defaults write com.apple.TextEdit RichText -int 0
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Photos
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############
## Bluetooth ##
###############

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40


############
# Printer ##
############

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

##############
## Keyboard ##
##############

defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

##############
## Trackpad ##
##############

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

##########
## Dock ##
##########

#Minimize windows into their application’s icon 
#defaults write com.apple.dock minimize-to-application -bool true
#Remove the animation when hiding or showing the dock
defaults write com.apple.dock autohide-time-modifier -float 0

####################
##Software update ##
####################

#While applying any changes to SoftwareUpdate defaults, set software update to OFF to avoid any conflict with the defaults system cache.
sudo softwareupdate --schedule OFF
####

#Automatically check for updates (required for any downloads):
$ sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticCheckEnabled -bool YES

#Download updates automatically in the background
$ sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool YES

#Install app updates automatically:
$ sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool YES

#Don't Install macos updates automatically
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdateRestartRequired -bool false

#Install system data file updates automatically:
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist ConfigDataInstall -bool YES

#Install critical security updates automatically:
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist CriticalUpdateInstall -bool YES

####
sudo softwareupdate --schedule ON
####

###########
## Other ##
###########

# For: Fuse / sshfs
sudo chmod +a "eskjor:allow:add_subdirectory" /Volumes

