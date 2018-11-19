#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

# install go
[ -d "$HOME/.go" ] && rm -rf "$HOME/.go"
$DOTFILES_PATH/bin/goinstall
GOROOT=$HOME/.go
GOPATH=$HOME/go
PATH=$GOROOT/bin:$GOPATH/bin:$PATH
go get -u github.com/nsf/gocode
