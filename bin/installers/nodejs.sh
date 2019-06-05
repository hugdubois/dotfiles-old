#!/usr/bin/env bash

case $(uname -s) in
    Linux*)     SCRIPT=$(readlink -f "$0") ;;
    Darwin*)    SCRIPT=$(greadlink -f "$0") ;;
    *)          echo "UNKNOW OS" && exit 1
esac
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

[ -f "$HOME/.asdf/asdf.sh" ] && . $HOME/.asdf/asdf.sh

npm install -g yarn
npm install -g neovim
#npm install -g gitbook-cli sass
#npm install -g diagrams grpcc instant-markdown-d mermaid.cli
#npm install -g elchemy
