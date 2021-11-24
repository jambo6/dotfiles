# Brew
export PATH=/opt/homebrew/bin:$PATH
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# Starship theme
eval "$(starship init zsh)"

# Add bin
export PATH="$HOME/bin:$PATH"

# For poetry on M1 chip
export SDKROOT="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk"

# Pyenv and poetry <3
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export PATH="$HOME/.poetry/bin:$PATH"
