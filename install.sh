#!/bin/bash

# This script does the following:
#   * Symlinks all toolbox scripts to $HOME/bin
#   * Sets up sourcing of .zshrc and .privaterc
#   * Sets up .xinitrc and terminator config

# Finds the directory that the script is located in
DIR=$( dirname $( readlink -f "$BASH_SOURCE" ) )

# Scripts
ln -fs $DIR/ssha $HOME/bin/ssha
ln -fs $DIR/ecp $HOME/bin/ecp
ln -fs $DIR/post-json $HOME/bin/post-json
ln -fs $DIR/workspace-title $HOME/bin/workspace-title

# Zsh
echo "source $DIR/.zshrc" > $HOME/.zshrc
echo "[ -f $DIR/.privaterc ] && source $DIR/.privaterc" >> $HOME/.zshrc

# Various configs
ln -fs $DIR/.xinitrc $HOME/.xinitrc
ln -fs $DIR/terminator_config $HOME/.config/terminator/config
ln -fs $DIR/.tmux.conf $HOME/.tmux.conf

# Dconf
dconf load / < $DIR/dconf_dump
