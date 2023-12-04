#!/bin/bash -e

# This script does the following:
#   * Symlinks all toolbox scripts to $HOME/bin
#   * Sets up sourcing of .zshrc and .privaterc
#   * Sets up .xinitrc, terminator config and .tmux.conf

# Finds the directory that the script is located in
DIR=$( dirname $( readlink -f "$BASH_SOURCE" ) )

# SHELL --------------

if ! echo $SHELL | grep zsh; then
    echo "Installing zsh..."
    sudo apt install -y zsh && chsh -s $(which zsh)
    echo "Please log out and back in again"
else
    echo "Shell is already zsh"
fi

if [ ! -e $HOME/.oh-my-zsh ]; then
    echo "Installing ohmyzsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ln -fs $DIR/dotfiles/.zshrc-oh-my-zsh $HOME/.zshrc
else
    echo "ohmyzsh already installed"
fi

# -------------------

echo "Installing apt packages..."
sudo apt install -y fonts-powerline xclip tmux

if [ ! -e $HOME/.fzf ]; then
    echo "Installing fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
    # change search keybind to ctrl+P
    sed -i "s/\^T/\^P/g" $HOME/.fzf/shell/key-bindings.zsh
else
    echo "fzf already installed"
fi

echo "Linking scripts..."
mkdir -p $HOME/bin
ln -fs $DIR/ssha/ssha $HOME/bin/ssha
ln -fs $DIR/scripts/ecp $HOME/bin/ecp
ln -fs $DIR/scripts/post-json $HOME/bin/post-json
ln -fs $DIR/scripts/workspace-title $HOME/bin/workspace-title

echo "Linking dotfiles..."
ln -fs $DIR/dotfiles/.xinitrc $HOME/.xinitrc
ln -fs $DIR/dotfiles/.tmux.conf $HOME/.tmux.conf

echo "Loading dconf..."
dconf load / < $DIR/dconf/dconf_dump

if ! grep -q ".gitconfig_append" $HOME/.gitconfig; then
    echo "Setting up gitconfig..."
    echo "[include]" >> $HOME/.gitconfig
    echo -e "\tpath = $DIR/dotfiles/.gitconfig_append" >> $HOME/.gitconfig
else
    echo "gitconfig already set up"
fi

mkdir -p $HOME/apps
if [ ! -e $HOME/apps/nvim.appimage ]; then
    echo "Installing neovim..."
    cd $HOME/apps
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    cd -
    ln -fs $DIR/nvim $HOME/.config

    echo "Installing plugged..."
    curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

#echo "Install neovim python package..."
#python3 -m pip install neovim

echo "---------------------"
echo "Toolbox installed!"
echo "Remember to run :PlugUpdate from neovim at first start!"
