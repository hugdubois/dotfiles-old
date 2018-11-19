#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)


# nvim
[ -d "$HOME/.config/nvim" ] && rm -rf "$HOME/.config/nvim"
ln -s "$DOTFILES_PATH/config/nvim" "$HOME/.config/nvim"
#ln -s "$HOME/go/src/github.com/sebdah/dotfiles/config/nvim" "$HOME/.config/nvim"
[ -d "$HOME/.vim" ] && rm -rf "$HOME/.vim"
#pip2 install --upgrade neovim
sudo pip3 install --upgrade pip
sudo pip3 install --upgrade neovim

# vim-go
[ -d "$GOPATH/src/github.com/nsf/gocode" ] && rm -rf "$GOPATH/src/github.com/nsf/gocode"
[ -f "$GOPATH/bin/gocode" ] && rm -f "$GOPATH/bin/gocode"
go get -u github.com/nsf/gocode
nvim +PlugInstall +qall
#nvim +GoInstallBinaries +qall
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

