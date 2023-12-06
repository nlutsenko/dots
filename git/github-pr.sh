#!/usr/bin/env bash

# Git Checkout a Pull Request locally.
#
# Usage: gfpr 8
# Where 8 is the number of pull request (can be found right after the PR's title).
# @author Ahmad Awais github.com/ahmadawais
#
function ghpr() {
	echo "${whitef}———————————————————${reset}"
	echo "${whiteb} ${blackf}0. Fetching the pull request...${reset}"

	git fetch origin pull/"${1}"/head:pull_"${1}"

	echo "${whiteb} ${blackf}1. PR fetched creating a branch...${reset}"

	git checkout pull_"${1}"

	echo "${whiteb} ${blackf}2. Checking out to a new PR branch...${reset}"

	echo "${greenb} ${blackf}3. PR Branch Created!!!${reset}"
	echo "${whitef}———————————————————${reset}"
}
