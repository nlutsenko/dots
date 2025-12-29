# Aliases
alias zshrc='subl -w $HOME/.zshrc && source $HOME/.zshrc'

# Folders
alias desktop='cd ~/Desktop/$1'
_cdsrc() { cd $HOME/src/$@ ;}
alias src=_cdsrc

# GNU
alias cat=ccat
alias ls='ls -AlGhgvo'
alias ll='exa -lha'
alias imgcat='~/.dotfiles/zsh/img_cat.sh'

# buck
alias b='buck2'
alias b2='buck2'

# Editor
alias mate='subl'

# git
alias git-master='git checkout master'
alias git-cleanup='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
