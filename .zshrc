# Some environment variables {{{
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
export PGUSER="postgres"
export PATH=$PATH:/Library/PostgreSQL/13/bin
export PATH=$PATH:/Users/jambo/.npm-global/bin
export PATH=$PATH:/Applications/Julia-1.6.app/Contents/Resources/julia/bin
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/bin/geckodriver
export PATH=$PATH:/usr/local/bin/chromedriver
export PATH=$PATH:$GOPATH/bin
export CC=gcc-8
export CXX=g++-8

# Settings for Stanford CoreNLP
export CORENLP_ROOT="/Users/jambo/Software/stanford-corenlp-4.2.1"
export CLASSPATH="$CORENLP_ROOT/javanlp-core.jar"
export CLASSPATH="$CLASSPATH:$CORENLP_ROOT/stanford-corenlp-models-current.jar"
for file in `find $CORENLP_ROOT -name "*.jar"`
do
    export CLASSPATH="$CLASSPATH:`realpath $file`"
done
# }}}

# zplug {{{1
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "jeffreytse/zsh-vi-mode"
zplug "agkozak/zsh-z"
zplug "zsh-users/zsh-history-substring-search"
zplug "djui/alias-tips"
zplug "plugins/git",   from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-completions", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to $PATH
#zplug load --verbose
zplug load
# 1}}}

# Aliases {{{1
# Apps
# alias psql="pgcli"
alias lz="lazygit"
alias vim="nvim"
alias julia="/Applications/Julia-1.6.app/Contents/Resources/julia/bin/julia"

# .rc type files
alias zshrc="vim ~/.zshrc"
alias srczsh="source ~/.zshrc"
alias initvim="vim ~/.config/nvim/init.vim"
alias dotfiles="cd ~/dotfiles"
alias psqlrc="vim ~/.psqlrc"
alias mongorc="vim ~/.mongorc.js"
alias mongoconf="vim /usr/local/etc/mongod.conf"
alias pgpass="vim ~/.pgpass"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias gitconf="vim ~/.gitconfig"

# TMUX {{{2
alias srctmux="tmux source-file ~/.tmux.conf"
alias tconf="vim ~/.tmux.conf"
alias tls="echo ; tmux ls; echo;"
tnew() { tmux new -s $1 ; }
tatt() { tmux a -t $1 ; }
tkill() { tmux kill-session -t $1 ; }
trename() { tmux rename-window $1 ;}
tjulia() {
    tmux new \; \
    send-keys "vim $1" Enter \; \
    split-window -v \; \
    rename-window julia \; \
    send-keys "julia" Enter \; \
    select-pane -t 0 \;
}
# 2}}}

# Some useful shortcuts
alias -- -="cd -"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"
alias myip="curl ifconfig.me"
alias clc="clear"
alias del="trash"
# Python
alias checkpython="ps -ef | grep python"
alias killpython="pkill -9 python"
alias jl="jupyter lab"
alias jls="jupyter notebook list"
# Virtualenv
alias activate="conda activate ./env"
alias base="conda activate base"

# Git aliases to override/extend git plugin
alias glp=glol
alias gs="git status -sb"
alias gm="git merge --squash"
alias gbv="gb -v"
alias gpt="gp --tags"

# 1}}}

# After mkdir, cd into it
mkcd() {
	mkdir -p "$*"
	cd "$*"
}

# For fzf
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi


# Conda {{{
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jambo/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jambo/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jambo/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jambo/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# }}}
conda activate base

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# export PATH="$PATH:$(yarn global bin)"
