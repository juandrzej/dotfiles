# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.

# Include .bashrc if running bash
if [ -n "$BASH_VERSION" ]; then
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# If running from tty1 start sway
export QT_QPA_PLATFORMTHEME=qt5ct
export ADW_DEBUG_COLOR_SCHEME=prefer-dark
[ "$(tty)" = "/dev/tty1" ] && exec sway
