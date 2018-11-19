#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)


# bash shell
[ -d "$HOME/.profile" ] && rm -rf "$HOME/.profile"
ln -s "$DOTFILES_PATH/profile" "$HOME/.profile"
[ -d "$HOME/.bash_aliases" ] && rm -rf "$HOME/.bash_aliases"
ln -s "$DOTFILES_PATH/bash_aliases" "$HOME/.bash_aliases"


