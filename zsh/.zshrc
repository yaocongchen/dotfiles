# Created by newuser for 5.9

# History config
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# alias start
alias lf="ls |fzf"
alias ll="ls -al"
alias llf="ls -al |fzf"
alias vi="nvim"
#alias vim="nvim"
#alias end

#plugins
source ~/.config/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#this adds a new line before each command but not the first one
precmd() { precmd() { echo } }
#this remove the new line after each clear
alias clear="precmd() {precmd() {echo }} && clear"

zvm_after_init_commands+=('bindkey "\ec" clear-screen')

eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/yaocong/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/yaocong/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/yaocong/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/yaocong/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export CPLUS_INCLUDE_PATH=/usr/include/c++/14:/usr/include/x86_64-linux-gnu/c++/14
#cuda
export LD_LIBRARY_PATH=/usr/local/cuda/lib64
export PATH=$PATH:/usr/local/cuda/bin


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set the default editor to nvim
export EDITOR="nvim"