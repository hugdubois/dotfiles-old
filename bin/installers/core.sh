#!/bin/sh

case $(uname -s) in
	Linux*)     SCRIPT=$(readlink -f "$0") ;;
	Darwin*)    SCRIPT=$(greadlink -f "$0") ;;
	*)          echo "UNKNOW OS" && exit 1
esac
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

mkdir -p $HOME/.local/bin
sudo mkdir -p /usr/local/bin
sudo mkdir -p /opt/bin

# install some bin tools
mkdir -p $HOME/bin
[ -f "$HOME/bin/ag-replace" ] && rm -rf $HOME/bin/ag-replace
ln -s "$DOTFILES_PATH/bin/ag-replace" "$HOME/bin/ag-replace"
[ -f "$HOME/bin/tar-grep" ] && rm -rf $HOME/bin/tar-grep
ln -s "$DOTFILES_PATH/bin/tar-grep" "$HOME/bin/tar-grep"
[ -f "$HOME/bin/new-fabulous-app" ] && rm -rf $HOME/bin/new-fabulous-app
ln -s "$DOTFILES_PATH/bin/new-fabulous-app" "$HOME/bin/new-fabulous-app"

