#!/bin/bash

# Dumps bits of dconf that you want synced between computers

# Finds the directory that the script is located in
DIR=$( dirname $( readlink -f "$BASH_SOURCE" ) )
DUMP_FILE="$DIR/dconf_dump"

dumpit() {
    # $1 = Path to dump
    # $2 = Thing to grep (optional)

    # Echo tag to file (sed removes the encapsulating slashes)
    tag=$( echo "$1" | sed -e "s/^\/\(.*\)\/$/\1/" )
    echo "[$tag]" >> $DUMP_FILE
    if [ $# -eq 2 ]; then
        dconf dump "$1" | grep "$2" >> $DUMP_FILE
    else
        dconf dump "$1" | tail -n +2 >> $DUMP_FILE
    fi

    echo "" >> $DUMP_FILE
}

echo "" > $DUMP_FILE
dumpit "/org/gnome/shell/" "enabled-extensions"
dumpit "/org/gnome/shell/extensions/workspace-grid/"
dumpit "/org/gnome/shell/overrides/"
dumpit "/org/gnome/desktop/wm/keybindings/"
dumpit "/org/gnome/desktop/input-sources/" "xkb-options"
dumpit "/org/zzrough/gs-extensions/drop-down-terminal/"

# Append the static dconf
cat $DIR/dconf_static >> $DUMP_FILE
