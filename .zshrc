
export PATH="/usr/local/opt/python/libexec/bin:$PATH"


export TERM="xterm-256color"

# if you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
alias phd="cd ~/Documents/PhD"
alias code="cd ~/Documents/PhD/code"
alias iterex="cd ~/Documents/PhD/code/iterex"
alias wesad="cd ~/Documents/PhD/code/actual/wesad"
alias sepsis="cd ~/Documents/PhD/code/actual/sepsis"
alias framework="cd ~/Documents/PhD/code/actual/iterex_ml_frame"

# Jupyter
alias jl="jupyter lab"
alias jls="jupyter notebook list"
jstop () {
	jupyter notebook stop $*
}
alias ajl="activate; jupyter lab"
alias jlssh="ssh -L 9000:localhost:9000 morrill@havok.maths.ox.ac.uk"

# Sphinx
alias opendocs="open docs/build/html/index.html"
alias makedocs="make -C ./docs html"

# Term commands
alias checkpython="ps -ef | grep python"
alias killpython="pkill -9 python"

# Run
alias cutcookies="cookiecutter https://github.com/drivendata/cookiecutter-data-science"
alias basecookiecutter="git clone https://github.com/jambo6/Base-project"

# Git
alias gs="git status"
alias ga="git add"
alias gr="git rm"
alias gcm="git commit -m"
alias gpom="git push origin master"
alias gpod="git push origin develop"
alias gcom="git checkout master"
alias gcod="git checkout develop"

# TMUX
alias tconf="vim ~/.tmux.conf"
alias tls="echo ; tmux ls; echo;"
tnew() { tmux new -s $1 ; }
tatt() { tmux a -t $1 ; }
tkill() { tmux kill-session -t $1 ; }
trename() { tmux rename-window $1 ;}

# For tmux colors
alias tmux="TERM=screen-256color-bce tmux"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme to load 
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	z
)

source $ZSH/oh-my-zsh.sh


# My things

# Aliases
alias zshrc="vim ~/git/dotfiles/.zshrc"
alias vimrc="vim ~/git/dotfiles/.vimrc"
alias gitdot="cd ~/git/dotfiles"
alias srczsh="source ~/.zshrc"
alias clc="clear"
alias del="trash"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias runtb="tensorboard --logdir=logs/ --host localhost --port 8088"

# Cheatsheets
alias cheatsheets="cd ~/Documents/other/cheatsheets"
alias cheatiterm="vim ~/Documents/stuff/cheatsheets/iterm.txt"
alias cheatmatlab="vim ~/Documents/stuff/cheatsheets/matlab.txt"
alias cheatvim="vim ~/Documents/stuff/cheatsheets/vim.txt"
alias cheattmux="vim ~/Documents/stuff/cheatsheets/tmux.txt"
alias cheatgit="vim ~/Documents/stuff/cheatsheets/git.txt"
alias cheatcpp="vim ~/Documents/stuff/cheatsheets/cpp.txt"
alias cheatpython="vim ~/Documents/stuff/cheatsheets/python.txt"
alias cheattf="vim ~/Documents/stuff/cheatsheets/tensorflow.txt"
alias tmatlab="matlab -nodesktop -nodisplay"
alias todothings="vim ~/Documents/stuff/todo/things.txt"


# # Add to path
# Conda
. /opt/miniconda3/etc/profile.d/conda.sh
conda activate base
alias activate="conda activate ./env"
alias base="conda activate base"

# npm
export PATH=$PATH:/Users/jambo/.npm-global/bin

# Functions
# After mkdir, cd into it
mkcd() {
	mkdir -p "$*"
	cd "$*"
}
makelatex() {
	python ~/.bash_scripts/compile_latex.py $1
}
# # ssh() {
	# # python ~/.bash_scripts/go_ssh.py $1
# # }
# cheat() {
	# python ~/.bash_scripts/cheatsheets.py $1
# }
# add_py_root() {
	# python ~/.bash_scripts/python_add_sources.py
# }

# Change prompt
DEFAULT_USER=username

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# if command -v pyenv 1>/dev/null 2>&1; then
  # eval "$(pyenv init -)"
# fi
