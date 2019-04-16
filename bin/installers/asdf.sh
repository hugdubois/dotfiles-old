#!/bin/sh

case $(uname -s) in
    Linux*)     SCRIPT=$(readlink -f "$0") ;;
    Darwin*)    SCRIPT=$(greadlink -f "$0") ;;
    *)          echo "UNKNOW OS" && exit 1
esac
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

[ -d "$HOME/.asdf" ] && rm -rf "$HOME/.asdf"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.1

[ -f "$HOME/.tool-versions" ] && rm -rf "$HOME/.tool-versions"
ln -s "$DOTFILES_PATH/tool-versions" "$HOME/.tool-versions"

#echo 'source ~/.asdf/asdf.fish' >> ~/.config/fish/config.fish
mkdir -p ~/.config/fish/completions; and cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
~/.asdf/bin/asdf update
~/.asdf/bin/asdf plugin-add erlang
~/.asdf/bin/asdf plugin-add elixir
~/.asdf/bin/asdf plugin-add nodejs
~/.asdf/bin/asdf plugin-add crystal
~/.asdf/bin/asdf plugin-add golang

cd $HOME
~/.asdf/bin/asdf install
cd $DOTFILES_PATH
