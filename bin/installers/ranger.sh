#!/bin/sh

case $(uname -s) in
    Linux*)     SCRIPT=$(readlink -f "$0") ;;
    Darwin*)    SCRIPT=$(greadlink -f "$0") ;;
    *)          echo "UNKNOW OS" && exit 1
esac
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

# ranger
ranger --copy-config=all
sed -i -e 's/set preview_images false/set preview_images true/g' $HOME/.config/ranger/rc.conf
sed -i -e 's/set draw_borders false/set draw_borders true/g' $HOME/.config/ranger/rc.conf
