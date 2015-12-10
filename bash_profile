# Basic
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'
export EDITOR='mate -w'

# $PATH
export PATH=/usr/local/bin:$PATH

# Ruby & RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Alias
alias src='cd ~/src/$1'
alias desktop='cd ~/Desktop/$1'
alias ls='ls -AlGfhgvo'

alias ramdisk='diskutil erasevolume HFS+ "RAMDisk" `hdiutil attach -nomount ram://4718592`'

# git
## Alias
alias master='git checkout master'
alias cleanup='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
## Completion
if [ -f ~/.dotfiles/git/git-completion.sh ]; then
  . .~/dotfiles/git/git-completion.sh
fi
## Command prompt with branch name
export GIT_PS1_SHOWUPSTREAM="verbose"
export GIT_PS1_SHOWDIRTYSTATE="blah"
export GIT_PS1_SHOWCOLORHINTS="blah"
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"; __git_ps1 "\u:\w" "\\\$ "'
source ~/.dotfiles/git/git-prompt.sh
## Branching
__git_feature() {
  exists=`git show-ref refs/heads/$1`
  if [ -n "$exists" ]; then
    git checkout $1
  else
    git checkout -b $1 && git branch --set-upstream-to=origin/master
  fi
}
alias feature=__git_feature

if [ -f ~/.profile ]; then
  source ~/.profile
fi
