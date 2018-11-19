#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)


# install rustc via rustup
[ -d "$HOME/.cargo" ] && rm -rf "$HOME/.cargo"
curl https://sh.rustup.rs -sSf | sh
PATH=$HOME/.cargo/bin:$PATH
# rustup update nightly
# rustup component add rustfmt-preview
cargo install exa
cargo install racer
cargo install rustfmt-nightly --force
