#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)


# tmux files
#   - tmux.conf        -> ~/.tmux.conf
#   - tmux.linux.conf  -> ~/.tmux.linux.conf
#   - tmux.darwin.conf -> ~/.tmux.darwin.conf
[ -f "$HOME/.tmux.conf" ] && rm "$HOME/.tmux.conf"
ln -s "$DOTFILES_PATH/tmux.conf" "$HOME/.tmux.conf"
[ -f "$HOME/.tmux.linux.conf" ] && rm "$HOME/.tmux.linux.conf"
ln -s "$DOTFILES_PATH/tmux.linux.conf" "$HOME/.tmux.linux.conf"
[ -f "$HOME/.tmux.darwin.conf" ] && rm "$HOME/.tmux.darwin.conf"
ln -s "$DOTFILES_PATH/tmux.darwin.conf" "$HOME/.tmux.darwin.conf"
[ -d "$HOME/.tmux" ] && rm -rf "$HOME/.tmux"
mkdir -p "$HOME/.tmux/plugins"
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/bin/install_plugins


