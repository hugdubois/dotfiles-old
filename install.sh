#!/bin/sh


SCRIPT=$(readlink -f "$0")
DOTFILES_PATH=$(dirname "$SCRIPT")

# tmux files
#   - tmux.conf              -> ~/.tmux.conf
#   - tmux.linux.conf        -> ~/.tmux.linux.conf
#   - tmux.darwin.conf       -> ~/.tmux.darwin.conf
[ -f "$HOME/.tmux.conf" ] && rm "$HOME/.tmux.conf"
ln -s "$DOTFILES_PATH/tmux.conf" "$HOME/.tmux.conf"
[ -f "$HOME/.tmux.linux.conf" ] && rm "$HOME/.tmux.linux.conf"
ln -s "$DOTFILES_PATH/tmux.linux.conf" "$HOME/.tmux.linux.conf"
[ -f "$HOME/.tmux.darwin.conf" ] && rm "$HOME/.tmux.darwin.conf"
ln -s "$DOTFILES_PATH/tmux.darwin.conf" "$HOME/.tmux.darwin.conf"
