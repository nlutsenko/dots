# OSX-only stuff. Abort if not OSX.
if [[ ! `uname` == 'Darwin' ]]; then
  return
fi

# Copy fonts
{
  pushd ~/.dotfiles/font/; setdiffA=(*); popd
  pushd ~/Library/Fonts/; setdiffB=(*); popd
  setdiff
} >/dev/null

if (( ${#setdiffC[@]} > 0 )); then
  e_header "Copying fonts (${#setdiffC[@]})"
  for f in "${setdiffC[@]}"; do
    e_arrow "$f"
    cp "~/.dotfiles/font/$f" ~/Library/Fonts/
  done
fi
