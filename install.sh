#!/bin/bash

# This script does the following:
#   * Symlinks all toolbox scripts to $HOME/bin
#   * Sets up sourcing of .zshrc and .privaterc
#   * Sets up .xinitrc and terminator config

# Finds the directory that the script is located in
DIR=$( dirname $( readlink -f "$BASH_SOURCE" ) )

# Scripts
ln -fs $DIR/ssha/ssha $HOME/bin/ssha
ln -fs $DIR/scripts/ecp $HOME/bin/ecp
ln -fs $DIR/scripts/post-json $HOME/bin/post-json
ln -fs $DIR/scripts/workspace-title $HOME/bin/workspace-title

# Zsh
echo "source $DIR/dotfiles/.zshrc" > $HOME/.zshrc
echo "[ -f $DIR/dotfiles/.zshrc_private ] && source $DIR/dotfiles/.zshrc_private" >> $HOME/.zshrc

# Various configs
ln -fs $DIR/dotfiles/.xinitrc $HOME/.xinitrc
ln -fs $DIR/dotfiles/terminator_config $HOME/.config/terminator/config
ln -fs $DIR/dotfiles/.tmux.conf $HOME/.tmux.conf

# Dconf
dconf load / < $DIR/dconf/dconf_dump
