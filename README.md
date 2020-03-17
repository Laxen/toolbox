# Toolbox
A toolbox with all my scripts and configs.

## How to install
1. Install oh-my-zsh
2. Install powerline fonts `sudo apt install fonts-powerline`
3. git clone --recurse-submodules https://github.com/Laxen/toolbox.git
4. Run `install.sh`

## Installing gnome-extension wsmatrix
1. Download the appropriate version here: https://extensions.gnome.org/extension/1485/workspace-matrix/
2. Unzip it and look at the "uuid" field in metadata.json
3. Make the folder $HOME/.local/share/gnome-shell/extensions/\<uuid\>
4. Unzip into that folder
5. Run "gnome-extensions enable \<uuid\>"
6. Log out and back in
7. Run "gnome-tweaks" -> Extensions -> Workspace matrix settings -> uncheck "Show workspace thumbnails" and check "Show workspace names"
