##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##@@@@@|  Shell script to run before Mac reset
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

SETUP_DIR=$HOME/mac_setup
cd $SETUP_DIR

BREWFILE=$SETUP_DIR/brewfile
FORMULA_LIST=$SETUP_DIR/brewable_formula_list
CASK_LIST=$SETUP_DIR/brewable_cask_list

##> Back up Homebrew installations

brew bundle dump --force --file=$BREWFILE

