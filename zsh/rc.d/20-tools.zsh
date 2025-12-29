# Homebrew
if [[ "$OSTYPE" == darwin* ]]; then
  export HOMEBREW_NO_ANALYTICS=1
  export HOMEBREW_AUTO_UPDATE_SECS=604800
fi

# pyenv
if command -v pyenv >/dev/null; then
  export PATH="$(pyenv root)/bin:$PATH"
  eval "$(pyenv init -)"
fi

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Oh My Posh
if command -v oh-my-posh >/dev/null; then
  eval "$(oh-my-posh init zsh --config "$HOME/.dotfiles/config/posh.json")"
fi
