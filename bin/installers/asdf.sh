#!/usr/bin/env bash

case $(uname -s) in
    Linux*)     SCRIPT=$(readlink -f "$0") ;;
    Darwin*)    SCRIPT=$(greadlink -f "$0") ;;
    *)          echo "UNKNOW OS" && exit 1
esac
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

[ -d "$HOME/.asdf" ] && rm -rf "$HOME/.asdf"
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.7.2

[ -f "$HOME/.tool-versions" ] && rm -rf "$HOME/.tool-versions"
#ln -s "$DOTFILES_PATH/tool-versions" "$HOME/.tool-versions"

mkdir -p $HOME/.config/fish/completions
cp $HOME/.asdf/completions/asdf.fish $HOME/.config/fish/completions
. $HOME/.asdf/asdf.sh

$HOME/.asdf/bin/asdf update
cat $DOTFILES_PATH/tool-versions | while read line
do
    echo "####### INSTALL : $line"
    plugin=$(echo $line | cut -d' ' -f1)
    $HOME/.asdf/bin/asdf plugin-add $plugin
    [ $plugin == "nodejs" ] && bash $HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring
    $HOME/.asdf/bin/asdf install $line
    $HOME/.asdf/bin/asdf global $line
    echo "####### END INSTALL : $line"
done
