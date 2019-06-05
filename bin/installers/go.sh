#!/usr/bin/env bash

case $(uname -s) in
    Linux*)     SCRIPT=$(readlink -f "$0") ;;
    Darwin*)    SCRIPT=$(greadlink -f "$0") ;;
    *)          echo "UNKNOW OS" && exit 1
esac
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

# install go
[ -d "$HOME/.go" ] && rm -rf "$HOME/.go"
mkdir "$HOME/.go"
. $HOME/.asdf/asdf.sh
# for vim-go
[ -d "$GOPATH/src/github.com/nsf/gocode" ] && rm -rf "$GOPATH/src/github.com/nsf/gocode"
[ -f "$GOPATH/bin/gocode" ] && rm -f "$GOPATH/bin/gocode"
go get -u github.com/nsf/gocode
#go get -u github.com/nsf/gocode
#go get -u github.com/zmb3/gogetdoc
#go get -u golang.org/x/tools/cmd/guru
#go get -u github.com/golang/lint/golint
#go get -u github.com/davidrjenni/reftools/cmd/fillstruct
#go get -u github.com/rogpeppe/godef
#go get -u github.com/fatih/motion
#go get -u github.com/kisielk/errcheck
#go get -u github.com/derekparker/delve/cmd/dlv
#go get -u github.com/jstemmer/gotags
#go get -u github.com/josharian/impl
#go get -u golang.org/x/tools/cmd/goimports
#go get -u github.com/fatih/gomodifytags
#go get -u github.com/dominikh/go-tools/cmd/keyify
#go get -u golang.org/x/tools/cmd/gorename
#go get -u github.com/klauspost/asmfmt/cmd/asmfmt
#go get -u github.com/alecthomas/gometalinter

