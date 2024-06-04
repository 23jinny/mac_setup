##> Only run if ./update_mac-settings.sh needs updating

SETUP_DIR=$HOME/mac_setup
AUX_DIR=$SETUP_DIR/auxiliary

FRESH_SETTINGS=$AUX_DIR/fresh-mac-settings.txt
CURRENT_SETTINGS=$AUX_DIR/current-mac-settings.txt
# MODIFIED_SETTINGS=$AUX_DIR/modified-mac-settings.txt

if [ ! -f $FRESH_SETTINGS ]
then
    defaults read > $FRESH_SETTINGS
fi

cp $FRESH_SETTINGS $CURRENT_SETTINGS
# git add $CURRENT_SETTINGS
# git commit -m "cp fresh-mac-settings.txt current-mac-settings.txt"

defaults read > $CURRENT_SETTINGS

##> Manually check modified settings using a git diff viewer (e.g., VS Code) and manually update ./update_mac-settings.sh
