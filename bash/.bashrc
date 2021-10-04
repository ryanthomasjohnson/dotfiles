# Path
export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"
# If not interactive, return
[[ $- != *i* ]] && return

# Include custom bash configuration
[ -f ~/.bashrc.before ] && source ~/.bashrc.before

export PATH=$HOME/.local/bin:$PATH
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
# Append history on every command
export PROMPT_COMMAND='history -a'
# Set timezone
export TZ='US/Pacific'
# Ignore bash deprecation for zsh on MacOS
export BASH_SILENCE_DEPRECATION_WARNING=1
# Set editor
export EDITOR=vim
export VISUAL=vim
# Prevent ^S from stopping the current process (^Q to resume)
stty stop undef
# [ Aliases ]
alias bell="echo -ne '\a'"
alias weather="curl wttr.in"
alias color='
for i in {0..255}; do
    printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
done
'
alias pass='lpass show -cp'
alias display='export DISPLAY=$(tmux show-env | sed -n "s/^DISPLAY=//p")'
alias ls='ls --color=auto'
export LESS="$LESS -Q -R"

# Include custom bash configuration
[ -f ~/.bashrc.after ] && source ~/.bashrc.after
# Include fzf bash configuration
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
