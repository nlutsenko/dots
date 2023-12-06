#!/usr/bin/env bash

## Check if we are running on macOS
if [[ $(uname || true) != 'Darwin' ]]; then
	return
fi

if ! command -v brew >/dev/null; then
	echo "Installing homebrew"
	install_script=$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)
	ruby -e "${install_script}"
	unset install_script
fi
