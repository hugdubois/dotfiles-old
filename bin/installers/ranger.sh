#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

# ranger
ranger --copy-config=all
sed -i -e 's/set preview_images false/set preview_images true/g' $HOME/.config/ranger/rc.conf
sed -i -e 's/set draw_borders false/set draw_borders true/g' $HOME/.config/ranger/rc.conf
