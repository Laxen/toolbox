# Toolbox
A toolbox with all my scripts and configs.

## Toolbox setup
1. `git clone --recurse-submodules https://github.com/Laxen/toolbox.git`
2. Run `install.sh`, what could possibly go wrong :)

## Neovim setup
1. `install.sh` already installs Neovim and Plugged
2. `python3 -m pip install neovim` might be needed, don't remember
3. `:PlugUpdate`
4. `:CocInstall coc-pyright`
5. `:checkhealth` to see what's broken

## Installing gnome-extension wsmatrix
1. `gnome-shell --version`
2. Download the appropriate version here: https://extensions.gnome.org/extension/1485/workspace-matrix/
3. `gnome-extensions install <zip-file>`
4. Log out and back in
5. `gnome-extensions enable wsmatrix@martin.zurowietz.de`
