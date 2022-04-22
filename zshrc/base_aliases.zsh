# Alias some bash scripts
alias pyproject="~/monorepo/dotfiles/scripts/pyproject/pyproject.sh"
alias poetryreq="poetry export -f requirements.txt --output requirements.txt"

# Easy peasy
alias psql="pgcli"
alias vim="nvim"

# Colored ls
alias ls='ls -G'

# Confirms
alias rm='rm -i'
alias 'rm -f'='rm -f -i'
alias 'rm -r'='rm -r -i'
alias 'rm -rf'='rm -rf -i'
alias cp='cp -i'
alias mv='mv -i'

# Fast access
alias m="cd ~/monorepo"
alias dotfiles="cd ~/monorepo/dotfiles"
alias zshrc="cd ~/monorepo/dotfiles/zshrc"
alias srczsh="source ~/.zshrc"
alias gitconfig="vim ~/.gitconfig"
alias initvim="vim ~/.config/nvim/init.vim"
alias scripts="cd ~/monorepo/dotfiles/scripts"

alias psqlrc="vim ~/.psqlrc"
alias pgpass="vim ~/.pgpass"

# Some useful shortcuts
alias -- -="cd -"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"
alias myip="curl ifconfig.me"
alias del="trash"
alias activate="conda activate ./env"

# Make dir and cd in
mkcd() {
	mkdir -p "$*"
	cd "$*"
}

# Python
alias checkpython="ps -ef | grep python" 
alias killpython="pkill -9 python"
