#!/bin/sh

case $(uname -s) in
	Linux*)     SCRIPT=$(readlink -f "$0") ;;
	Darwin*)    SCRIPT=$(greadlink -f "$0") ;;
	*)          echo "UNKNOW OS" && exit 1
esac
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

[ -d "$HOME/.ideavimrc" ] && rm -rf "$HOME/.ideavimrc"
ln -s "$DOTFILES_PATH/ideavimrc" "$HOME/.ideavimrc"

# continious keys on vim mode
defaults write com.jetbrains.intellij ApplePressAndHoldEnabled -bool flase
