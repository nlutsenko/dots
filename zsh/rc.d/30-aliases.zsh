# Aliases
alias zshrc='subl -w $HOME/.zshrc && source $HOME/.zshrc'

# Folders
alias desktop='cd ~/Desktop/$1'
_cdsrc() { cd $HOME/src/$@ ;}
alias src=_cdsrc

# GNU
# Only override cat when the colorize plugin actually loaded; otherwise leave
# `cat` alone so non-interactive shells (or boxes missing pygmentize/chroma)
# still have a working `cat`.
if (( $+functions[colorize_cat] )); then
  alias cat=ccat
fi
alias ls='ls -AlGhgvo'
alias ll='exa -lha'
alias imgcat='~/.dotfiles/zsh/img_cat.sh'

# buck
alias b='buck2'
alias b2='buck2'

# Editor
if [[ "$OSTYPE" == darwin* ]]; then
  alias mate='subl'
else
  alias mate='rmate'
fi

# git
alias git-master='git checkout master'
alias git-cleanup='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
