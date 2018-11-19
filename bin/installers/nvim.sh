#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)


# nvim
[ -d "$HOME/.config/nvim" ] && rm -rf "$HOME/.config/nvim"
ln -s "$DOTFILES_PATH/config/nvim" "$HOME/.config/nvim"
[ -d "$HOME/.vim" ] && rm -rf "$HOME/.vim"
#pip2 install --upgrade neovim
sudo pip3 install --upgrade pip
sudo pip3 install --upgrade neovim
gem install neovim

nvim +PlugInstall +qall
#nvim +GoInstallBinaries +qall
