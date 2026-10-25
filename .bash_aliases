# General, most used
alias ff='fastfetch'
alias reload='source ~/.bashrc'
alias wifi='nmcli dev wifi list'
alias nf='file=$(find . -type f -not -path "*/node_modules/*" -not -path "*/__pycache__/*" -not -path "*/.git/*" | fzf --height 40% --layout=reverse --border --preview "head -50 {}") && nvim "$file"'
alias ktmux='tmux kill-server'
alias mpcc='mpc rescan && mpc update'

# Git
alias glog='git log --oneline --decorate --graph --parents'
alias gdif='git diff'
alias gstatus='git status'

# Overwrites
alias cp='cp -i' # prompt before overwriting files
alias mv='mv -i'
alias rm='trash -v'    # using safer trash-cli
alias mkdir='mkdir -p' # auto create parent dir/s

# File and dir helpers
alias ll='lsd -l' # long format (lsd has default -h)
alias la='lsd -A' # hidden files exluding . & ..
alias lla='lsd -lA'
alias lr='lsd -lR'                # recursive
alias lf='lsd -l | egrep -v "^d"' # files only
alias ldir='lsd -l | egrep "^d"'  # directories only
alias atree='lsd --tree --all --ignore-glob .git'
alias atreep='lsd --tree --all --ignore-glob .git --ignore-glob .venv  --ignore-glob __pycache__ --ignore-glob .mypy_cache --ignore-glob .pytest_cache'
alias rmd='/bin/rm  --recursive --force --verbose ' # Remove a directory and all files
alias fh='fd -H'                                    # include hidden

# Power commands
alias nap='systemctl suspend'
# alias bignap='systemctl suspend-then-hibernate'
alias reset='sudo reboot'
alias die='sudo shutdown now'

# Change directory aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# For debian due to diff package name
if command -v batcat >/dev/null 2>&1; then
	alias bat='batcat'
	alias fd='fdfind'
	alias nala-up='sudo nala update && sudo nala upgrade'
fi
