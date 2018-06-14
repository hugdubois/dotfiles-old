fish_vi_key_bindings
set -gx LESS '-F -g -i -M -R -S -w -X -z-4'
set -gx GOROOT ~/.go
set -gx GOPATH ~/go
set -gx NVM_DIR ~/.nvm
set -gx BROWSER open
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.utf-8
set -gx LC_ALL en_US.UTF-8
set -gx FZF_DEFAULT_COMMAND 'ag --hidden --skip-vcs-ignores --ignore .git --ignore vendor --ignore node_modules -g ""'
set -gx LSCOLORS 'Exfxcxdxbxegedabagacad'
set -gx ZSH "~/.oh-my-zsh"

# Disable the fish greeting
set fish_greeting ""

#fish_vi_key_bindings

. ~/.profile-secrets.fish
. ~/.config/fish/prompt.fish

# Aliases
alias grep 'grep --color=auto'
alias scp "scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias ssh "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias tmux "tmux -2"

alias vim "nvim"
alias vimdiff "nvim -d"
alias cls "clear"

alias cd-go-src "cd $GOPATH/src"
alias cd-go-bin "cd $GOPATH/bin"
alias cd-github "cd $GOPATH/src/github.com"
alias cd-hugdubois "cd $GOPATH/src/github.com/hugdubois"
alias cd-dotfiles "cd $GOPATH/src/github.com/hugdubois/dotfiles"
alias cd-gomeet "cd $GOPATH/src/github.com/gomeet"
alias cd-gomeet-gomeet "cd $GOPATH/src/github.com/gomeet/gomeet"

alias l "exa -Gla --git"
alias e "editor"

alias open "xdg-open"

# dcleanup can be used to clean up docker images.
function dcleanup
  docker rm -v (docker ps --filter status=exited -q ^ /dev/null) ^ /dev/null
  docker rmi (docker images --filter dangling=true -q ^ /dev/null) ^ /dev/null
  docker volume rm (docker volume ls -qf dangling=true)
end

# Environment variables
set -gx PATH \
  ~/bin \
  ~/.go/bin \
  ~/go/bin \
  ~/.fzf/bin \
  ~/.cargo/bin \
  ~/.local/bin \
  /usr/bin \
  /usr/sbin \
  /usr/local/bin \
  /opt/bin \
  $PATH

