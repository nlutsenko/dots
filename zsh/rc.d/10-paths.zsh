# Paths: system
export PATH="/usr/local/bin:$PATH"
if [[ "$OSTYPE" == darwin* ]]; then
  export PATH="$HOME/homebrew/bin:$HOME/homebrew/sbin:$PATH"
fi

# Paths: user
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.dotfiles/posh/bin"

# Paths: rvm
export PATH="$PATH:$HOME/.rvm/bin"
