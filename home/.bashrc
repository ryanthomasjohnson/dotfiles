# If not interactive, return
[[ $- != *i* ]] && return

# Set terminal prompt
export PS1="$ "
# Set vi(m) mode at prompt
set -o vi

# ALIASES
alias bell="echo -ne '\a'"
alias weather="curl wttr.in"

