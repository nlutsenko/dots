#!/usr/bin/env bash

## Check if we are running on macOS

if [[ $(uname || true) != 'Darwin' ]]; then
	return
fi

# Copy fonts
e_header "Copying fonts (${#setdiffC[@]})"
cp -f "${HOME}/.dotfiles/font/*" "${HOME}/Library/Fonts"
