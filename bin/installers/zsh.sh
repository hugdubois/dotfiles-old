#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

# zsh shell
[ -d "$HOME/.oh-my-zsh" ] && rm -rf "$HOME/.oh-my-zsh"
git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
[ -f "$HOME/.zshrc" ] && rm -f "$HOME/.zshrc"
ln -s "$DOTFILES_PATH/zshrc" "$HOME/.zshrc"
[ -f "$HOME/.env" ] && rm -f "$HOME/.env"
ln -s "$DOTFILES_PATH/env" "$HOME/.env"
[ -f "$HOME/.aliases" ] && rm -f "$HOME/.aliases"
ln -s "$DOTFILES_PATH/aliases" "$HOME/.aliases"
touch "$HOME/.profile-secrets.zsh"


