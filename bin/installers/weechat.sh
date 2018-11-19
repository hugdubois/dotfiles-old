#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

# weechat
mkdir -p $HOME/.weechat/python/autoload
[ -f "$HOME/.weechat/irc.conf" ] && rm "$HOME/.weechat/irc.conf"
[ -f "$HOME/.weechat/weechat.conf" ] && rm "$HOME/.weechat/weechat.conf"
ln -s "$DOTFILES_PATH/weechat/irc.conf" "$HOME/.weechat/irc.conf"
ln -s "$DOTFILES_PATH/weechat/weechat.conf" "$HOME/.weechat/weechat.conf"
[ -f "$HOME/.weechat/python/autoload/notify_send.py" ] && rm "$HOME/.weechat/python/autoload/notify_send.py"
ln -s "$DOTFILES_PATH/weechat/python/autoload/notify_send.py" "$HOME/.weechat/python/autoload/notify_send.py"

