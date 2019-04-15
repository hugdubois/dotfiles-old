#!/bin/sh

case $(uname -s) in
    Linux*)     SCRIPT=$(readlink -f "$0") ;;
    Darwin*)    SCRIPT=$(greadlink -f "$0") ;;
    *)          echo "UNKNOW OS" && exit 1
esac
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

[ -d "$HOME/.config/mpd" ] && rm -rf "$HOME/.config/mpd"
mkdir -p $HOME/.config/mpd
ln -s "$DOTFILES_PATH/config/mpd/mpd.conf" "$HOME/.config/mpd/mpd.conf"

