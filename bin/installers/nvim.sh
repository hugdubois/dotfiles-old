#!/bin/sh

case $(uname -s) in
    Linux*)     SCRIPT=$(readlink -f "$0") ;;
    Darwin*)    SCRIPT=$(greadlink -f "$0") ;;
    *)          echo "UNKNOW OS" && exit 1
esac
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)


# nvim
[ -d "$HOME/.config/nvim" ] && rm -rf "$HOME/.config/nvim"
ln -s "$DOTFILES_PATH/config/nvim" "$HOME/.config/nvim"
[ -d "$HOME/.vim" ] && rm -rf "$HOME/.vim"
#pip2 install --upgrade neovim
#sudo pip3 install --force-reinstall pip
sudo pip2 install --force-reinstall neovim websocket-client sexpdata
sudo pip3 install --force-reinstall neovim websocket-client sexpdata
sudo gem install neovim

nvim +PlugInstall +qall
nvim +GoInstallBinaries +qall
