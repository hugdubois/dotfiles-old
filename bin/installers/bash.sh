#!/bin/sh

case $(uname -s) in
    Linux*)     SCRIPT=$(readlink -f "$0") ;;
    Darwin*)    SCRIPT=$(greadlink -f "$0") ;;
    *)          echo "UNKNOW OS" && exit 1
esac
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)


# bash shell
[ -f "$HOME/.bashrc" ] && rm -rf "$HOME/.bashrc"
ln -s "$DOTFILES_PATH/bashrc" "$HOME/.bashrc"
[ -f "$HOME/.env" ] && rm -rf "$HOME/.env"
ln -s "$DOTFILES_PATH/env" "$HOME/.env"
[ -f "$HOME/.profile" ] && rm -rf "$HOME/.profile"
ln -s "$DOTFILES_PATH/profile" "$HOME/.profile"
[ -f "$HOME/.bash_aliases" ] && rm -rf "$HOME/.bash_aliases"
ln -s "$DOTFILES_PATH/bash_aliases" "$HOME/.bash_aliases"


