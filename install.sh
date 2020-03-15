#!/bin/bash

# This script does the following:
#   * Symlinks all toolbox scripts to $HOME/bin
#   * Sets up sourcing of .zshrc and .privaterc
#   * Sets up .xinitrc, terminator config and .tmux.conf

# Finds the directory that the script is located in
DIR=$( dirname $( readlink -f "$BASH_SOURCE" ) )

# Scripts
ln -fs $DIR/ssha/ssha $HOME/bin/ssha
ln -fs $DIR/scripts/ecp $HOME/bin/ecp
ln -fs $DIR/scripts/post-json $HOME/bin/post-json
ln -fs $DIR/scripts/workspace-title $HOME/bin/workspace-title

# Zsh
cp -f $HOME/.zshrc $HOME/.zshrc.prev
echo "Backed up your existing .zshrc to .zshrc.prev"
ln -fs $DIR/dotfiles/.zshrc-oh-my-zsh $HOME/.zshrc

# Various configs
ln -fs $DIR/dotfiles/.xinitrc $HOME/.xinitrc
ln -fs $DIR/dotfiles/terminator_config $HOME/.config/terminator/config
ln -fs $DIR/dotfiles/.tmux.conf $HOME/.tmux.conf

# Dconf
dconf load / < $DIR/dconf/dconf_dump
