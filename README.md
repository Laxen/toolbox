# Toolbox
A toolbox with all my scripts and configs.

## Toolbox setup
1. Install zsh `sudo apt install zsh && chsh -s $(which zsh)` (Log out and in again)
2. Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
3. `sudo apt install fonts-powerline xclip tmux`
4. git clone --recurse-submodules https://github.com/Laxen/toolbox.git
5. Run `install.sh`

## Neovim setup
1. Install [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim#Linux)
2. Install Plugged
```
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
3. `pip3 install neovim`
4. Run :PlugUpdate from Neovim
5. Compile YCM
```
sudo apt install build-essential cmake python3-dev
cd $HOME/.vim/plugged/YouCompleteMe
python3 install.py
```

## Installing gnome-extension wsmatrix
1. Download the appropriate version here: https://extensions.gnome.org/extension/1485/workspace-matrix/
2. `gnome-extensions install <zip-file>`
3. Log out and back in
4. `gnome-extensions enable wsmatrix@martin.zurowietz.de`
