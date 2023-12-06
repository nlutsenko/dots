#!/usr/bin/env bash

if ! command -v rvm >/dev/null; then
	curl -sSL https://get.rvm.io | bash -s stable
fi

rvm gemset import default.gems
