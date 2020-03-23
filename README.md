# Toolbox
A toolbox with all my scripts and configs.

## Installing the toolbox
1. Install oh-my-zsh
2. Install powerline fonts `sudo apt install fonts-powerline`
3. Install xclip `sudo apt install xclip`
4. git clone --recurse-submodules https://github.com/Laxen/toolbox.git
5. Run `install.sh`

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

Manual installation:
2. Unzip it and look at the "uuid" field in metadata.json
3. Make the folder $HOME/.local/share/gnome-shell/extensions/\<uuid\>
4. Unzip into that folder
5. Run "gnome-extensions enable \<uuid\>"
6. Log out and back in
7. Run "gnome-tweaks" -> Extensions -> Workspace matrix settings -> uncheck "Show workspace thumbnails" and check "Show workspace names"
