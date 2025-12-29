# Setup
plugins=(git)
if [[ "$OSTYPE" == darwin* ]]; then
  plugins+=(brew)
fi

export ZSH="$HOME/.dotfiles/zsh/src"
source "$ZSH/oh-my-zsh.sh"

# Colors
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export LESS="-R"
export PAGER='less -KFX'

# Options
unsetopt nomatch

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=2000000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY

autoload -Uz add-zsh-hook
history_merge() { fc -R; }
add-zsh-hook precmd history_merge

# Editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='rmate -w'
elif [[ "$OSTYPE" == darwin* ]]; then
  export EDITOR='subl -w'
else
  export EDITOR='vim'
fi
