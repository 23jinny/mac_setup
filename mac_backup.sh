##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##@@@@@|  Shell script to run before Mac reset
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

SETUP_DIR=$HOME/mac_setup

##> Back up brew/mas installations, VS Code extensions

BREWFILE=$SETUP_DIR/files/brewfile
FORMULA_LIST=$SETUP_DIR/files/brewable_formula_list
CASK_LIST=$SETUP_DIR/files/brewable_cask_list

brew bundle dump --force --file=$BREWFILE

##> Back up application configuration files

MACKUP_CFG_FILE=$SETUP_DIR/files/.mackup.cfg
MACKUP_CUSTOM_DIR=$SETUP_DIR/files/.mackup

if [ -f $MACKUP_CFG_FILE ]
then
    if [ ! -f $MACKUP_CFG_FILE ]
    then
        ln -s ~/mac_setup/files/.mackup.cfg ~/.mackup.cfg
    fi

    if [ -f $MACKUP_CUSTOM_DIR ]
    then
        if [ ! -f $MACKUP_CUSTOM_DIR]
        then
            ln -s ~/mac_setup/files/.mackup ~/.mackup
        fi
    fi

    mackup backup --force && mackup uninstall --force
fi