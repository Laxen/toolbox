# This script does the following:
#   * Symlinks all toolbox scripts to $HOME/bin
#   * Sets up your .xinitrc and terminator config

# Finds the directory that the script is located in
DIR=$( dirname $( readlink -f "$BASH_SOURCE" ) )

# Scripts
ln -fs $DIR/ssha $HOME/bin/ssha
ln -fs $DIR/ecp $HOME/bin/ecp
ln -fs $DIR/post-json $HOME/bin/post-json
ln -fs $DIR/workspace-title $HOME/bin/workspace-title

# Configs
ln -fs $DIR/.xinitrc $HOME/.xinitrc
ln -fs $DIR/terminator_config $HOME/.config/terminator/config
