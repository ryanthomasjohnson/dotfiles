# If not interactive, return
[[ $- != *i* ]] && return

# Set terminal
export TERM='screen-256color'
# Turn on `ls` colors for MacOS
export CLICOLOR=1
# Set terminal prompt
export PS1="$ "
# Set vi(m) mode at prompt
set -o vi
# Save history on every prompt
shopt -s histappend
export PROMPT_COMMAND='history -a'
# Set timezone
TZ="US/Eastern"
# Ignore bash deprecation for zsh on MacOS
export BASH_SILENCE_DEPRECATION_WARNING=1

# ALIASES
alias bell="echo -ne '\a'"
alias weather="curl wttr.in"
alias color='
for i in {0..255}; do
    printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
done
'

