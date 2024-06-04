##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##@@@@@|  Shell script to run before Mac reset
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

SETUP_DIR=$HOME/mac_setup
cd $SETUP_DIR

BREWFILE=$SETUP_DIR/files/brewfile
FORMULA_LIST=$SETUP_DIR/files/brewable_formula_list
CASK_LIST=$SETUP_DIR/files/brewable_cask_list

##> Back up Homebrew installations

brew bundle dump --force --file=$BREWFILE

