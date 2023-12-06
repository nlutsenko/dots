#!/usr/bin/env bash

if ! command -v brew >/dev/null; then
	echo "Installing homebrew"
	install_script=$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)
	ruby -e "${install_script}"
	unset install_script
fi
