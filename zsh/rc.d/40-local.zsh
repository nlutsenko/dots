# Local
if [[ -f "$HOME/.profile" ]]; then
  source "$HOME/.profile"
fi

if [[ -f "$HOME/.dotfiles-private/bash_profile" ]]; then
  source "$HOME/.dotfiles-private/bash_profile"
fi
