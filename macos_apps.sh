#!/usr/bin/env bash
#
# Script that installs macOS apps

## Check if we are running on macOS
if [[ $(uname || true) != 'Darwin' ]]; then
	return
fi

# Mac App Store

## Check if we've got homebrew
if ! command -v brew >/dev/null; then
	printf "Homebrew is not installed, aborting installs from Mac App Store\n\n"
fi

if ! command -v mas >/dev/null; then
	printf "Installing Mac App Store CLI via Homebrew...\n\n"
	brew install mas
fi

## Install Apps

### Reeder 5
mas install 1529448980

### Tailscale
mas install 1475387142

### Telegram
mas install 747648890

# Direct Downloads

function _install_app {
	local -r url=${1:?"URL must be specified."}
	local -r install_location=${2:?"Install location must be specified."}
	local -r app_name=${3?"App name must be specified."}
	local -r archive_type=${4?"Archive type needs to be speified"}

	local -r target_app_location="${install_location}/${app_name}.app"
	if [[ ! -d ${target_app_location} ]]; then
		echo "Downloading & Installing ${app_name}..."

		temp_date=$(date +%s)
		local -r temp_name="${temp_date}"
		local -r download_file="${HOME}/Downloads/${temp_name}_download"

		# Download
		curl -L "${url}" -o "${download_file}"

		# Unpack
		local unpack_location="${HOME}/Downloads/${temp_name}_unpacked"
		case ${archive_type} in
		"tar")
			mkdir -p "${unpack_location}"
			tar -xjf "${download_file}" -C "${unpack_location}/"
			;;
		"zip")
			unzip "${download_file}" -d "${unpack_location}/"
			;;
		"dmg")
			unpack_location="/Volumes/${temp_name}_mnt"
			hdiutil mount "${download_file}" -mountpoint "${unpack_location}"
			;;
		*)
			echo "Unsupported archive type ${archive_type}"
			exit 1
			;;
		esac

		# Copy to target location
		cp -R "${unpack_location}/${app_name}.app" "${target_app_location}"

		# Cleanup
		if [[ ${archive_type} == "dmg" ]]; then
			hdiutil unmount "${unpack_location}"
		else
			rm -r "${unpack_location}"
		fi
		rm "${download_file}"

		# Open from the target location
		open "${target_app_location}"
	else
		echo "${app_name} is already installed, skipping."
	fi
}

## Notion

_install_app \
	"https://www.notion.so/desktop/mac-universal/download" \
	"/Applications" \
	"Notion" \
	"dmg"

## VS Code

_install_app \
	"https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal" \
	"/Applications" \
	"Visual Studio Code" \
	"zip"

## TextMate

_install_app \
	"https://api.textmate.org/downloads/release?os=10.12" \
	"/Applications" \
	"TextMate" \
	"tar"

## iTerm

_install_app \
	"https://iterm2.com/downloads/stable/latest" \
	"/Applications" \
	"iTerm" \
	"zip"
