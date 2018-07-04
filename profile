source /usr/share/defaults/etc/profile
source ~/.env
source ~/.bash_aliases
[ -f ~/.profile.secret ] && source ~/.profile.secret

export PATH="$HOME/.cargo/bin:$PATH"
