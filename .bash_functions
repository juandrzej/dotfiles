# Open bash files easily for more readabiltity.
funcs() {
	bat --style=numbers --language bash "$HOME/.bash_functions"
}
aliases() {
	bat --style=numbers --language bash "$HOME/.bash_aliases"
}

# Stage everything in the repo, commit with a message, then push.
# Usage: gpush "<commit message>"
gpush() {
	local message="${1:-}"
	if [ -z "$message" ]; then
		echo "Usage: push <commit message>"
		return 1
	fi
	git add -A
	git commit -m "$message"
	git push
}

# Copy files with rsync using archive mode, progress output, and stats.
# Usage: cpr <source> <destination>
cpr() {
	rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 "$@"
}

# Copy files with rsync and remove the source files after a successful transfer.
# Usage: mvr <source> <destination>
mvr() {
	rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-files "$@"
}

# Mount a filesystem into ~/mnt, preserving the current user's uid/gid.
# Usage: mnt <source>
mnt() {
	local src="${1:-}"
	if [ -z "$src" ]; then
		echo "Usage: mnt <source>"
		return 1
	fi

	mkdir -p "$HOME/mnt"
	sudo mount -o "uid=$(id -u),gid=$(id -g)" "$src" "$HOME/mnt"
}

# Launch yazi, then cd back to the directory yazi left you in when it exits.
# This is useful because yazi is a file manager and may change your working directory.
function y() {
	local tmp cwd
	tmp="$(mktemp)"
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Connect to a Wi‑Fi network using SSID and optional password.
# Usage: wificonnect <ssid> [password]
wificonnect() {
	local ssid="${1:-}"
	local password="${2:-}"

	if [ -z "$ssid" ]; then
		echo "Usage: wificonnect <ssid> [password]"
		return 1
	fi

	if [ -n "$password" ]; then
		nmcli dev wifi connect "$ssid" password "$password"
	else
		nmcli dev wifi connect "$ssid"
	fi
}
