####> References: https://macos-defaults.com, https://github.com/mathiasbynens/dotfiles/blob/main/.macos

SETUP_DIR=$HOME/mac_setup
AUX_DIR=$SETUP_DIR/auxiliary

##> Obtain sudo permissions until the end of this script

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

##> Close open System settings windows, if any

osascript -e 'tell application "System settings" to quit'

##====================================================================
##=====|  MacOS settings

####> Keyboard settings

defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)

####> Trackpad settings

####> Mouse settings

defaults write -g com.apple.mouse.linear -bool "true"

####> Display settings

####> Power settings

####> Dock settings

defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-time-modifier" -float "0.3"
defaults write com.apple.dock "autohide-delay" -float "0"
defaults write com.apple.dock "mineffect" -string "suck"
defaults write com.apple.dock "expose-group-apps" -bool "true"

####> Finder settings

# defaults write com.apple.finder "QuitMenuItem" -bool "true"
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false"
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "false"
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "false"
defaults write -g "AppleShowAllExtensions" -bool "true"
defaults write -g "NSDocumentSaveNewDocumentsToCloud" -bool "false"

####> Typing settings

defaults write -g NSAutomaticCapitalizationEnabled -bool false

####> Miscellaneous settings

defaults write com.apple.LaunchServices "LSQuarantine" -bool "false"

##> Expanding the save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

##> Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

####> Restart applications

killall Dock
killall Finder
killall SystemUIServer
killall Xcode
killall TextEdit

##====================================================================
##=====|  3rd-party application settings

