#!/bin/sh

case $(uname -s) in
    Linux*)     SCRIPT=$(readlink -f "$0") ;;
    Darwin*)    SCRIPT=$(greadlink -f "$0") ;;
    *)          echo "UNKNOW OS" && exit 1
esac
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$(realpath $SCRIPT_PATH/../..)

# fish shell and fisherman
[ -d "$HOME/.config/fish" ] && rm -rf "$HOME/.config/fish"
[ -d "$HOME/.config/fisherman" ] && rm -rf "$HOME/.config/fisherman"
[ -d "$HOME/.local/fish" ] && rm -rf "$HOME/.local/fish"
mkdir -p "$HOME/.config/fish/functions"
mkdir -p "$HOME/.config/fish/completions"
touch $HOME/.profile-secrets.fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fish -c 'fish_update_completions'
fish -c 'fisher add edc/bass fishpkg/fish-await jethrokuan/z jethrokuan/fzf fishpkg/fish-last-job-id franciscolourenco/done jorgebucaran/fish-getopts fishpkg/fish-humanize-duration'

ln -s "$DOTFILES_PATH/config/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -s "$DOTFILES_PATH/config/fish/prompt.fish" "$HOME/.config/fish/prompt.fish"

[ -f "$HOME/.config/fish/fishfile" ] && mv "$HOME/.config/fish/fishfile" "$DOTFILES_PATH/config/fish/fishfile"
ln -s "$DOTFILES_PATH/config/fish/fishfile" "$HOME/.config/fish/fishfile"
ln -s "$DOTFILES_PATH/config/fish/functions/__informative_git_prompt.fish" "$HOME/.config/fish/functions/__informative_git_prompt.fish"
ln -s "$DOTFILES_PATH/config/fish/completions/git.fish" "$HOME/.config/fish/completions/git.fish"


