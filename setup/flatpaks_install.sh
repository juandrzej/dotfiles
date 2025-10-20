#!/bin/bash

# Check if Flatpak is installed
if ! command -v flatpak &>/dev/null; then
	echo "Error: Flatpak is not installed. Install it first."
	exit 1
fi

# Add Flathub remote (if not already added)
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Update existing flatpak repos
flatpak update -y --noninteractive

# Install applications silently with --noninteractive (avoids prompts)
flatpak install -y flathub com.protonvpn.www
flatpak install -y flathub com.brave.Browser
flatpak install -y flathub md.obsidian.Obsidian
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub org.signal.Signal
flatpak install -y flathub com.spotify.Client
