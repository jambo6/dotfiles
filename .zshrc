export TERM="xterm-256color"


# if you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Current work location
alias phd="cd ~/Documents/Work/phd"
alias codeactual="cd ~/Documents/Work/phd/code/actual"
alias codepractice="cd ~/Documents/Work/phd/code/practice"
alias chf="cd ~/Documents/work/revon/chf_project"
alias mypython="cd ~/Documents/work/python"
alias sshmaths="ssh morrill@gate.maths.ox.ac.uk"

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
  git
)

source $ZSH/oh-my-zsh.sh


# My things

# Aliases
# alias python="python3"
alias zshrc="vim ~/git/dotfiles/.zshrc"
alias vimrc="vim ~/git/dotfiles/.vimrc"
alias gitdot="cd ~/git/dotfiles"
alias srczsh="source ~/.zshrc"
alias clc="clear"
alias del="trash"
alias ohmyzsh="mate ~/.oh-my-zsh"

# Cheatsheets
alias cheatsheets="cd ~/Documents/stuff/cheatsheets"
alias cheatiterm="vim ~/Documents/stuff/cheatsheets/iterm.txt"
alias cheatmatlab="vim ~/Documents/stuff/cheatsheets/matlab.txt"
alias cheatvim="vim ~/Documents/stuff/cheatsheets/vim.txt"
alias cheattmux="vim ~/Documents/stuff/cheatsheets/tmux.txt"
alias cheatgit="vim ~/Documents/stuff/cheatsheets/git.txt"
alias cheatcpp="vim ~/Documents/stuff/cheatsheets/cpp.txt"
alias cheatpython="vim ~/Documents/stuff/cheatsheets/python.txt"
alias tmatlab="matlab -nodesktop -nodisplay"
alias todothings="vim ~/Documents/stuff/todo/things.txt"


# # Git aliases
alias ga="git add"
alias gau="git add -u"
alias gat="git add -u :/"
alias gp="git push"
alias gpom="git push origin master"
alias gl="git log"
alias gs="git status"
alias gd="git diff"
alias gcm="git commit -m"
alias gcma="git commit -am"
alias gb="git branch"
alias gc="git checkout"
alias gra="git remote add"
alias grr="git remote rm"
alias gpu="git pull"
alias gpuom="git pull origin master"
alias gcl="git clone"
alias gta="git tag -a -m"
alias gf="git reflog"


# # Virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# # NAG env variable
export NAG_KUSARI_FILE=$HOME/NAG/mbmi625dcl/nag.key

# # Tensorflow
# Running without venv
alias runtf="source ~/tensorflow/bin/activate" 


# Add to path
#
export PATH=/Applications/MATLAB_R2017b.app/bin:$PATH
export PATH=~/anaconda3/bin:$PATH


# Functions
# After mkdir, cd into it
mkcd() {
	mkdir -p "$*"
	cd "$*"
}

# Change prompt
DEFAULT_USER=username


