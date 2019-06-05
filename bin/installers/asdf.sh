#!/usr/bin/env bash

case $(uname -s) in
    Linux*)     SCRIPT=$(readlink -f "$0") ;;
    Darwin*)    SCRIPT=$(greadlink -f "$0") ;;
    *)          echo "UNKNOW OS" && exit 1
esac
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

VERSION_FILE="$DOTFILES_PATH/tool-versions"
[ -f "$DOTFILES_PATH/tool-versions.$1" ] && VERSION_FILE="$DOTFILES_PATH/tool-versions.$1"

[ -d "$HOME/.asdf" ] && rm -rf "$HOME/.asdf"
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.7.1

[ -f "$HOME/.tool-versions" ] && rm -rf "$HOME/.tool-versions"
#ln -s "$DOTFILES_PATH/tool-versions" "$HOME/.tool-versions"

mkdir -p $HOME/.config/fish/completions
cp $HOME/.asdf/completions/asdf.fish $HOME/.config/fish/completions
. $HOME/.asdf/asdf.sh

$HOME/.asdf/bin/asdf update
cat $VERSION_FILE | while read line
do
    echo "####### INSTALL : $line"
    plugin=$(echo $line | cut -d' ' -f1)
    $HOME/.asdf/bin/asdf plugin-add $plugin
    [ $plugin == "nodejs" ] && bash $HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring
    $HOME/.asdf/bin/asdf install $line
    $HOME/.asdf/bin/asdf global $line
    echo "####### END INSTALL : $line"
done
