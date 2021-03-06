# If not interactive, return
[[ $- != *i* ]] && return

# Include custom bashrc configuration
[ -f ~/.bashrc.before ] && source ~/.bashrc.before

# Set terminal
# export TERM='screen-256color'
# Turn on `ls` colors for MacOS
export CLICOLOR=1
# Set terminal prompt
export PS1='$ '
# Set vi(m) mode at prompt
set -o vi
# Append history on shell exit
shopt -s histappend
# Unlimited history file size
export HISTFILESIZE=-1
# Limit history entries
export HISTSIZE=1000000
# Ignore commands starting with spaces and consecutive duplicate commands
export HISTCONTROL='ignorespace:ignoredups'
# Append history
export PROMPT_COMMAND='history -a'
# Set timezone
export TZ='US/Eastern'
# Ignore bash deprecation for zsh on MacOS
export BASH_SILENCE_DEPRECATION_WARNING=1
# Set editor
export EDITOR=$(which vi)
export VISUAL=$(which nvim || which vim || which vi)
# [ Aliases ]
alias bell="echo -ne '\a'"
alias weather="curl wttr.in"
alias color='
for i in {0..255}; do
    printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
done
'
alias vim="nvim"
alias vi="nvim"
alias pass='lpass show -cp'
alias notes="${HOME}/scripts/notes.sh"
alias display='export DISPLAY=$(tmux show-env | sed -n "s/^DISPLAY=//p")'
alias ls='ls --color=auto'

# Include custom bashrc configuration
[ -f ~/.bashrc.after ] && source ~/.bashrc.after
