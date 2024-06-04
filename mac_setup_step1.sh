##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##@@@@@|  Shell script to run after Mac fresh install
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

SETUP_DIR=$HOME/mac_setup

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

mkdir -p ~/Drive
mkdir -p ~/Pictures/Screenshots

##====================================================================
##=====|  Install applications

BREWFILE=$SETUP_DIR/files/brewfile
FORMULA_LIST=$SETUP_DIR/files/brew-formula-list.txt
CASK_LIST=$SETUP_DIR/files/brew-cask-list.txt
MAS_LIST=$SETUP_DIR/files/mas-list.txt

##> Install Homebrew

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/sjlee/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

##> Install from brewfile (brew formulae, brew casks, mas apps, VS Code extensions)

if [ -f $BREWFILE ]
then
    brew bundle install --file=$BREWFILE
fi

##> Install brew CLI applications

if [ -f $FORMULA_LIST ]
then
brew install --no-quarantine $(cat $FORMULA_LIST)
fi

##> Install brew GUI applications

if [ -f $CASK_LIST ]
then
brew install --cask --no-quarantine $(cat $CASK_LIST)
fi

##> Install mas Apple Store applications

if [ -f $MAS_LIST ]
then
mas install $(cat $MAS_LIST)
fi

##> Install pyenv

if [ -d ~/.pyenv ]
then
    rm -rf ~/.pyenv
fi

curl https://pyenv.run | /bin/bash

##> Install latest python using pyenv and set global version

# pyenv install --force 3
# pyenv global $(pyenv versions | grep -o "3\.*[0-9]*\.*[0-9]*")


##====================================================================
##=====|  Configure application settings

##> Set bash as default shell

# chsh -s /opt/homebrew/bin/bash

##> Import application settings (mackup) -> Also restores ~/.bashrc

MACKUP_CFG_FILE=$SETUP_DIR/files/.mackup.cfg
MACKUP_CUSTOM_DIR=$SETUP_DIR/files/.mackup

if [ -f $MACKUP_CFG_FILE ]
then
    ln -s ~/mac_setup/files/.mackup.cfg ~/.mackup.cfg

    if [ -d $MACKUP_CUSTOM_DIR ]
    then
        ln -s ~/mac_setup/files/.mackup ~/.mackup
    fi

    mackup restore --force && mackup uninstall --force
fi

# sqlite is keg-only, which means it was not symlinked into /opt/homebrew,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.

# If you need to have sqlite first in your PATH, run:
#   echo 'export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"' >> /Users/sjlee/.bash_profile

# For compilers to find sqlite you may need to set:
#   export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
#   export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"

# For pkg-config to find sqlite you may need to set:
#   export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig"

##====================================================================
##=====|  Configure Mac settings

/bin/bash $SETUP_DIR/scripts/update_mac-settings.sh
