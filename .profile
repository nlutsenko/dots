export EDITOR=mate
export PATH=/usr/local/bin:$PATH

# Aliases
## Common
alias home='git --work-tree=$HOME --git-dir=$HOME/.files.git'
alias ls='ls -AlGfhgo'
## Git
alias ship='arc amend && git branch --set-upstream-to=origin/master && git pull --rebase && git push origin HEAD:master'
alias lander='git checkout -b lander && git branch --set-upstream-to=origin/master && git rebase -i && git pull --rebase'

# Tools
## arcanist
export PATH=~/src/devtools/arcanist/bin:$PATH

## xctool
export PATH=~/src/devtools/xctool:$PATH

# Git
# Autocompletion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
# Command prompt with branch name
source ~/.git-prompt.sh
export PS1="\h:\W \$(__git_ps1)$ "