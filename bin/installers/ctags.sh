#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

# ctags
[ -f "$HOME/.ctags" ] && rm -rf "$HOME/.ctags"
ln -s "$DOTFILES_PATH/ctags" "$HOME/.ctags"

