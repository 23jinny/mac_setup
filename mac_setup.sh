##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##@@@@@|  Shell script to run after Mac fresh install
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

##> Set variables

SETUP_DIR=$HOME/mac_setup
AUX_DIR=$SETUP_DIR/auxiliary

##> Obtain sudo permissions until the end of this script

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

##> Create directories

mkdir -p ~/backups
mkdir -p ~/bin
mkdir -p ~/data
mkdir -p ~/lib
mkdir -p ~/opt
mkdir -p ~/scripts
mkdir -p ~/projects
mkdir -p ~/var
mkdir -p ~/var/log
mkdir -p ~/var/tmp
mkdir -p ~/Pictures/Screenshots


##====================================================================
##=====|  Configure Mac settings

$(which bash) $AUX_DIR/update_mac-settings.sh


##====================================================================
##=====|  Install applications

##> Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

##> Install applications

brew install --no-quarantine $(cat $AUX_DIR/brew-formula-list.txt)
brew install --cask --no-quarantine $(cat $AUX_DIR/brew-cask-list.txt)
mas install $(cat $AUX_DIR/mas-list.txt)

##====================================================================
##=====|  Import application settings


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
