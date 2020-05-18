[ $TERM != "screen" ] && TERM=xterm-256color && exec tmux
export PS1="$ "
set -o vi
# ALIASES
alias bell="echo -ne '\a'"
alias weather="curl wttr.in"

