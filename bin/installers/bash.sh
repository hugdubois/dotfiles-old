#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)


# bash shell
[ -f "$HOME/.env" ] && rm -rf "$HOME/.env"
ln -s "$DOTFILES_PATH/env" "$HOME/.env"
[ -f "$HOME/.bash_profile" ] && rm -rf "$HOME/.bash_profile"
ln -s "$DOTFILES_PATH/bash_profile" "$HOME/.bash_profile"
[ -f "$HOME/.bash_aliases" ] && rm -rf "$HOME/.bash_aliases"
ln -s "$DOTFILES_PATH/bash_aliases" "$HOME/.bash_aliases"


