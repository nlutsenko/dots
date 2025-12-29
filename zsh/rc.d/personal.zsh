# Personal
if [[ -r "$HOME/.dotfiles/git/github-pr.sh" ]]; then
  source "$HOME/.dotfiles/git/github-pr.sh"
fi

# Bun
if [[ -s "$HOME/.bun/_bun" ]]; then
  source "$HOME/.bun/_bun"
fi

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
