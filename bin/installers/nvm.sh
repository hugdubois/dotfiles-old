#!/bin/sh

case $(uname -s) in
    Linux*)     SCRIPT=$(readlink -f "$0") ;;
    Darwin*)    SCRIPT=$(greadlink -f "$0") ;;
    *)          echo "UNKNOW OS" && exit 1
esac
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

# install nvm + node + npm
command -v npm >/dev/null 2>&1 && sudo npm uninstall npm -g
[ -d "$HOME/.nvm" ] && rm -rf "$HOME/.nvm"
[ -d "$HOME/.npm" ] && rm -rf "$HOME/.npm"
NVM_DIR=""
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
NVM_DIR=$HOME/.nvm
\. "$NVM_DIR/nvm.sh"
nvm install stable
nvm alias default stable
nvm use --delete-prefix stable
npm install -g yarn
npm install -g neovim
npm install -g elm elm-format elm-live elm-oracle elm-test
npm install -g gitbook-cli sass
#npm install -g diagrams grpcc instant-markdown-d mermaid.cli

