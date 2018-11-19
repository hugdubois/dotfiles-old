#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)


# mc
[ -d "$HOME/.config/mc" ] && rm -rf "$HOME/.config/mc"
mkdir -p $HOME/.config/mc
ln -s "$DOTFILES_PATH/config/mc/ini" "$HOME/.config/mc/ini"
