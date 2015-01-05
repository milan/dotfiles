# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Define Colours
export norm="\[\033[0m\]"
export black="\[\033[0;30m\]"
export dkgray="\[\033[1;30m\]"
export blue="\[\033[0;34m\]"
export lt_blue="\[\033[1;34m\]"
export green="\[\033[0;32m\]"
export lt_green="\[\033[1;32m\]"
export cyan="\[\033[0;36m\]"
export lt_cyan="\[\033[1;36m\]"
export red="\[\033[0;31m\]"
export lt_red="\[\033[1;31m\]"
export purple="\[\033[0;35m\]"
export lt_purple="\[\033[1;35m\]"
export brown="\[\033[0;33m\]"
export yellow="\[\033[1;33m\]"
export lt_gray="\[\033[0;37m\]"
export white="\[\033[1;37m\]"

# Color manpages?
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Some basic bash stuff
export TERM='xterm-color'
export EDITOR=vim
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S '
export HISTFILESIZE=10000
export HISTSIZE=10000
export GREP_OPTIONS="--color=auto"
export LESS="-niSRX"
export OS=`uname -s`
export UNISONLOCALHOSTNAME=`hostname -s`
export GOPATH="$HOME/.go"

# Enable color support of ls and also add handy aliases
[ -x /usr/bin/dircolors ] && eval "`dircolors -b`"

# Set Standard PATH
PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Correct minor spelling errors in 'cd' commands.
shopt -s cdspell

# Don't try to find all the command possibilities when hitting TAB on an empty line.
shopt -s no_empty_cmd_completion

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Home directory bin?
[ -d ~/bin ] && PATH=$PATH:~/bin

# /opt/local/{bin,sbin}?
[ -d /opt/local/bin ] && PATH=$PATH:/opt/local/bin:/opt/local/sbin

# Suck up those aliases
[ -f ~/.bash/aliases ] && . ~/.bash/aliases

# Any private settings?
[ -f ~/.bash/private ] && . ~/.bash/private

# Import OS Specific stuff
[ -f ~/.bash/$OS ] && . ~/.bash/$OS

# Import functions
[ -f ~/.bash/functions ] && . ~/.bash/functions

# Output local TODO list if it exists
[ -f ~/.todo ] && (echo "** TODO LIST **"; cat ~/.todo)

# Additional completions
[ -f ~/.bash/completions ] && . ~/.bash/completions

# Additional completions
[ -f ~/.bash/ssh ] && . ~/.bash/ssh

# Enable command/file completion with sudo
complete -f -c sudo
