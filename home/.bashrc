# If not interactive, return
[[ $- != *i* ]] && return

# Set terminal prompt
export PS1="$ "
# Set vi(m) mode at prompt
set -o vi
# Save history and reload on every prompt
export PROMPT_COMMAND="history -a; history -n"
# Set timezone
TZ="US/Eastern"

# ALIASES
alias bell="echo -ne '\a'"
alias weather="curl wttr.in"

