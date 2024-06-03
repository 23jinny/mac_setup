####> References: https://macos-defaults.com, https://github.com/mathiasbynens/dotfiles/blob/main/.macos

SETUP_DIR=$HOME/mac_setup
AUX_DIR=$SETUP_DIR/auxiliary

##> Close open System Settings windows, if any

osascript -e 'tell application "System Settings" to quit'

####> Keyboard Settings



####> Trackpad Settings



####> Mouse Settings

defaults write NSGlobalDomain com.apple.mouse.linear -bool "true"

####> Display Settings



####> Power Settings



####> Dock Settings

defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-time-modifier" -float "0.3"
defaults write com.apple.dock "autohide-delay" -float "0"
defaults write com.apple.dock "mineffect" -string "suck"
defaults write com.apple.dock "expose-group-apps" -bool "true"

####> Finder Settings

# defaults write com.apple.finder "QuitMenuItem" -bool "true"
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false"
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "false"
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "false"
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"

####> Miscellaneous Settings

defaults write com.apple.LaunchServices "LSQuarantine" -bool "false"

####> Wrapup

killall Dock
killall Finder
killall SystemUIServer
killall Xcode
killall TextEdit