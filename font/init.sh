# OSX-only stuff. Abort if not OSX.
if [[ ! `uname` == 'Darwin' ]]; then
  return
fi

# Copy fonts
e_header "Copying fonts (${#setdiffC[@]})"
cp -f $HOME/.dotfiles/font/* $HOME/Library/Fonts 
