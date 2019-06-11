#!/usr/bin/env bash

case $(uname -s) in
    Linux*)     SCRIPT=$(readlink -f "$0") ;;
    Darwin*)    SCRIPT=$(greadlink -f "$0") ;;
    *)          echo "UNKNOW OS" && exit 1
esac
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)


[ -d "$HOME/.sbt/1.0/plugins" ] || mkdir -p "$HOME/.sbt/1.0/plugins"
[ -f "$HOME/.sbt/1.0/plugins/plugins.sbt" ] && rm "$HOME/.sbt/1.0/plugins/plugins.sbt"
ln -s "$DOTFILES_PATH/sbt/1.0/plugins/plugins.sbt" "$HOME/.sbt/1.0/plugins/plugins.sbt"


coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=coc.nvim \
  org.scalameta:metals_2.12:0.5.2 \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o /usr/local/bin/metals-vim -f
