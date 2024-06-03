##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##@@@@@|  Shell script to run after Mac fresh install
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

SETUP_DIR=$HOME/mac_setup
cd $SETUP_DIR

##====================================================================
##=====|  Configure Mac settings

####> References: https://macos-defaults.com, https://github.com/mathiasbynens/dotfiles/blob/main/.macos

##> Obtain sudo permissions for a while

# sudo -v

# # Keep-alive: update existing `sudo` time stamp until `.macos` has finished
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# ##> Create folders

# mkdir -p ~/backups
# mkdir -p ~/bin
# mkdir -p ~/data
# mkdir -p ~/lib
# mkdir -p ~/opt
# mkdir -p ~/scripts
# mkdir -p ~/projects
# mkdir -p ~/var
# mkdir -p ~/var/log
# mkdir -p ~/var/tmp

# mkdir -p ~/Pictures/Screenshots

# ##> Close open System Settings windows, if any

# osascript -e 'tell application "System Settings" to quit'

# ####> Keyboard Settings

# defaults write com.apple.HIToolbox AppleFnUsageType -int "2"
# defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true
# defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"
# defaults write NSGlobalDomain KeyRepeat -int 2

# ####> Trackpad Settings

# defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int "0"
# defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "true"
# defaults write NSGlobalDomain "com.apple.trackpad.forceClick" -int "0";
# defaults write NSGlobalDomain "com.apple.trackpad.scaling" -int "2";

# ####> Mouse Settings

# defaults write NSGlobalDomain com.apple.mouse.linear -bool "true"

# ####> Display Settings

# ####> Power Settings

# ####> Dock Settings

# defaults write com.apple.dock "autohide" -bool "true"
# defaults write com.apple.dock "autohide-time-modifier" -float "0.3"
# defaults write com.apple.dock "autohide-delay" -float "0"
# defaults write com.apple.dock "mineffect" -string "suck"
# defaults write com.apple.dock "expose-group-apps" -bool "true"

# ####> Finder Settings

# # defaults write com.apple.finder "QuitMenuItem" -bool "true"
# defaults write com.apple.finder "ShowPathbar" -bool "true"
# defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
# defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
# defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
# defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false"
# defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "false"
# defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "false"
# defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
# defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"


# ####> General Applications Settings

# defaults write com.apple.LaunchServices "LSQuarantine" -bool "false"

# ####> Miscellaneous Settings

# defaults write com.apple.screencapture "location" -string "~/Pictures/Screenshots"
# defaults write com.apple.dt.Xcode "ShowBuildOperationDuration" -bool "true"
# defaults write com.apple.TextEdit "RichText" -bool "false"
# defaults write com.apple.TextEdit "SmartQuotes" -bool "false"
# defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true"
# defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool "true"

# ##> Always show scrollbars
# defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# # Possible values: `WhenScrolling`, `Automatic` and `Always`

# ##> Expand save panel by default
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# ##> Expand print panel by default
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# ##> Automatically quit printer app once the print jobs complete
# defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# ##> Disable the “Are you sure you want to open this application?” dialog
# defaults write com.apple.LaunchServices LSQuarantine -bool false

# ##> Disable automatic capitalization as it’s annoying when typing code
# defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# ##> Disable smart dashes as they’re annoying when typing code
# defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# ##> Disable automatic period substitution as it’s annoying when typing code
# defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# ##> Disable smart quotes as they’re annoying when typing code
# defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# ##> Disable auto-correct
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# ####> Wrapup

# killall Dock
# killall Finder
# killall SystemUIServer
# killall Xcode
# killall TextEdit








##====================================================================
##=====|  Install applications


##====================================================================
##=====|  Import application settings



##> Install Homebrew

# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

##> Install brew-installable applications

BREWFILE=$SETUP_DIR/brewfile
FORMULA_LIST=$SETUP_DIR/brew-formula-list.txt
CASK_LIST=$SETUP_DIR/brew-formula-list.txt
MAS_LIST=$SETUP_DIR/mas-list.txt

if [ -f $BREWFILE ]
then
    brew bundle install --file=$BREWFILE
else
    if [ -f $FORMULA_LIST ]
    then
    brew install $(cat $FORMULA_LIST)
    fi

    if [ -f $CASK_LIST ]
    then
    brew install --cask --no-quarantine $(cat $CASK_LIST)
    fi

    if [ -f $MAS_LIST ]
    then
    mas install $(cat $MAS_LIST)
    fi
fi

##> Install Xcode Command Line Tools

xcode-select --install
