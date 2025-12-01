#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ll='lsd -la'
alias l='lsd -a'
alias grep='grep --color=auto'
alias lg='lazygit'
PS1='[\u@\h \W]\$ '
