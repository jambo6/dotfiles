# conf file with sourcing
alias t="tmux"
alias tconf="vim ~/.tmux.conf"
alias srctmux="tmux source-file ~/.tmux.conf"

# Lists open windows
alias tls="echo ; tmux ls; echo;"

# Create/attach/rename/kill session with name 
tnew() { tmux new -s $1 ; }
tatt() { tmux a -t $1 ; }
tkill() { tmux kill-session -t $1 ; }
trename() { tmux rename-window $1 ;}

# Start tmux with slime window using julia
tjulia() {
    tmux new \; \
    send-keys "vim $1" Enter \; \
    split-window -v \; \
    rename-window julia \; \
    send-keys "julia" Enter \; \
    select-pane -t 0 \;
}
