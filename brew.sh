#!/usr/bin/env bash

if ! which brew > /dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any installed formulae.
brew upgrade --all

# Necessities
brew install carthage
brew install go
brew install git

# Cleanup
brew cleanup
brew prune
