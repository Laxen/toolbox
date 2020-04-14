# Toolbox
A toolbox with all my scripts and configs.

## Installing the toolbox
1. Install zsh `sudo apt install zsh`
2. Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
3. Install powerline fonts `sudo apt install fonts-powerline`
4. Install xclip `sudo apt install xclip`
5. git clone --recurse-submodules https://github.com/Laxen/toolbox.git
6. Run `install.sh`

## Installing Neovim
1. Install Plugged
```
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
2. Install Neovim package for Python3
```
pip3 install neovim
```
3. Compile YCM
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
