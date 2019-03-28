#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

[ -f /usr/local/bin/stack ] && rm -f /usr/local/bin/stack
[ -d "$HOME/.stack" ] && rm -rf $HOME/.stack
curl -sSL https://get.haskellstack.org/ | sh
[ -f "$HOME/.haskeline" ] && rm -rf $HOME/.haskeline
ln -s "$DOTFILES_PATH/haskeline" "$HOME/.haskeline"

