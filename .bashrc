#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ll='lsd -la'
alias l='lsd -a'
alias ls='lsd -a'
alias grep='grep --color=auto'
alias lg='lazygit'
PS1='[\u@\h \W]\$ '

export NIXPKGS_ALLOW_UNFREE=1
export PATH=$PATH:/home/mlpx/.local/bin

freshfetch
cat ~/.todo.md

eval "$(oh-my-posh init bash --config '~/.config/hypr/ohmyposh.json')"
