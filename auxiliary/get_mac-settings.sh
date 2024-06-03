SETUP_DIR=$HOME/mac_setup
AUX_DIR=$SETUP_DIR/auxiliary

FRESH_SETTINGS=$AUX_DIR/fresh-mac-settings.txt
UPDATED_SETTINGS=$AUX_DIR/updated-mac-settings.txt

if [ ! -f $FRESH_SETTINGS ]
then
    defaults read > $FRESH_SETTINGS
fi

defaults read > $UPDATED_SETTINGS