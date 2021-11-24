source ~/monorepo/dotfiles/zshrc/env.zsh
source ~/monorepo/dotfiles/zshrc/base_aliases.zsh
source ~/monorepo/dotfiles/zshrc/z_plug.zsh
source ~/monorepo/dotfiles/zshrc/git.zsh
source ~/monorepo/dotfiles/zshrc/tmux.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jambo/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jambo/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/jambo/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jambo/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

