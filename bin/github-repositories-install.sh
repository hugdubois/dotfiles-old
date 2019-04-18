#!/bin/sh

GITHUB_PATH="$HOME/src/github.com"

REPOS="gomeet/gomeet
gomeet/go-proto-gomeetfaker
gomeet/faker
gomeet/elm-protobuf
gomeet/gomeet-tools-markdown-server
gomeet/gomeet-godoc
gomeet/gomeet-builder
gomeet/gomeet-go-swagger
hugdubois/ah-svc-www
"
for repo in $REPOS; do
	if [ -d "$GITHUB_PATH/$repo" ]; then
		echo "[SKIP] - $repo derectory: $GITHUB_PATH/$repo exists"
	else
		mkdir -p $GITHUB_PATH/$repo
		git clone https://github.com/$repo $GITHUB_PATH/$repo
	fi;
done
