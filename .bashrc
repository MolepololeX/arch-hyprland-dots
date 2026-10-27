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
alias machsgut='shutdown -h 0'
alias tt='. ~/.config/hypr/kittyOpacity.sh'
PS1='[\u@\h \W]\$ '

export NIXPKGS_ALLOW_UNFREE=1
export CHROME_EXECUTABLE=google-chrome-stable
export PATH=$PATH:/home/mlpx/.local/bin
export PATH=$PATH:/home/mlpx/tools/flutter_3_47_6/flutter/bin
export PATH=$PATH:/home/mlpx/tools/dotnet10
export PATH=$PATH:/home/mlpx/.dotnet/tools
export DOTNET_ROOT="$HOME/tools/dotnet10"

# freshfetch
# neofetch
fetch
# cat ~/.todo.txt

eval "$(oh-my-posh init bash --config '~/.config/hypr/ohmyposh.json')"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
