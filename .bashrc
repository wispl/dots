#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ignore subsequent similar command
export HISTCONTROL=ignoredups
# check size on window resize
shopt -s checkwinsize
# do not autocomplete when command is missing
shopt -s no_empty_cmd_completion
# append to history file
shopt -s histappend

# bash completion
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -l"
alias ..="cd .."
alias grep="grep --color=auto"

alias ncdu="ncdu --color dark"
alias vim="nvim"
alias vi="nvim"

alias dots="git --git-dir=$HOME/.dots/ --work-tree=$HOME"

PS1="\[\e[34m\]\W\[\e[m\] "
