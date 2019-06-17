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


coursier bootstrap --standalone org.scalameta:scalafmt-cli_2.12:2.0.0-RC8 \
  -r sonatype:snapshots \
  -o /usr/local/bin/scalafmt_ng -f \
  --main com.martiansoftware.nailgun.NGServer

launchctl remove "nailgun.scalafmt"
[ -f "$HOME/Library/LaunchAgents/nailgun.scalafmt.plist" ] && rm "$HOME/Library/LaunchAgents/nailgun.scalafmt.plist"
ln -s "$DOTFILES_PATH/Library/LaunchAgents/nailgun.scalafmt.plist" "$HOME/Library/LaunchAgents/nailgun.scalafmt.plist"
launchctl load -w "$HOME/Library/LaunchAgents/nailgun.scalafmt.plist"
ng ng-alias scalafmt org.scalafmt.cli.Cli
