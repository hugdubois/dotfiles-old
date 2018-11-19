#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

[ -d "$HOME/.config/mpd" ] && rm -rf "$HOME/.config/mpd"
mkdir -p $HOME/.config/mpd
ln -s "$DOTFILES_PATH/config/mpd/mpd.conf" "$HOME/.config/mpd/mpd.conf"

