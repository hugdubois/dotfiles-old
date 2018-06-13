#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")
DOTFILES_PATH=$SCRIPT_PATH/..

# fzf
[ -d "$HOME/.fzf" ] && $HOME/.fzf/uninstall && rm -rf "$HOME/.fzf"
git clone https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install

# tmux files
#   - tmux.conf        -> ~/.tmux.conf
#   - tmux.linux.conf  -> ~/.tmux.linux.conf
#   - tmux.darwin.conf -> ~/.tmux.darwin.conf
[ -f "$HOME/.tmux.conf" ] && rm "$HOME/.tmux.conf"
ln -s "$DOTFILES_PATH/tmux.conf" "$HOME/.tmux.conf"
[ -f "$HOME/.tmux.linux.conf" ] && rm "$HOME/.tmux.linux.conf"
ln -s "$DOTFILES_PATH/tmux.linux.conf" "$HOME/.tmux.linux.conf"
[ -f "$HOME/.tmux.darwin.conf" ] && rm "$HOME/.tmux.darwin.conf"
ln -s "$DOTFILES_PATH/tmux.darwin.conf" "$HOME/.tmux.darwin.conf"
[ -d "$HOME/.tmux" ] && rm -rf "$HOME/.tmux"
mkdir -p "$HOME/.tmux/plugins"
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/bin/install_plugins


# fish shell
[ -d "$HOME/.config/fish" ] && rm -rf "$HOME/.config/fish"
[ -d "$HOME/.config/fisherman" ] && rm -rf "$HOME/.config/fisherman"
mkdir -p "$HOME/.config/fish/functions"
touch $HOME/.profile-secrets.fish
ln -s "$DOTFILES_PATH/config/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -s "$DOTFILES_PATH/config/fish/prompt.fish" "$HOME/.config/fish/prompt.fish"
ln -s "$DOTFILES_PATH/config/fish/fishfile" "$HOME/.config/fish/fishfile"
ln -s "$DOTFILES_PATH/config/fish/functions/__informative_git_prompt.fish" "$HOME/.config/fish/functions/__informative_git_prompt.fish"
ln -s "$DOTFILES_PATH/config/fish/functions/nvm.fish" "$HOME/.config/fish/functions/nvm.fish"
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fish -c 'fisher install await done get omf/git-flow last_job_id docker-completion fzf getopts humanize_duration z'

# zsh shell
[ -d "$HOME/.oh-my-zsh" ] && rm -rf "$HOME/.oh-my-zsh"
git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
[ -f "$HOME/.zshrc" ] && rm -f "$HOME/.zshrc"
ln -s "$DOTFILES_PATH/zshrc" "$HOME/.zshrc"
[ -f "$HOME/.env.zsh" ] && rm -f "$HOME/.env.zsh"
ln -s "$DOTFILES_PATH/env.zsh" "$HOME/.env.zsh"
[ -f "$HOME/.aliases.zsh" ] && rm -f "$HOME/.aliases.zsh"
ln -s "$DOTFILES_PATH/aliases.zsh" "$HOME/.aliases.zsh"
touch "$HOME/.profile-secrets.zsh"

