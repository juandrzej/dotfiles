# Alias's to modified commands
alias cp='cp -i' # prompt before overwriting files
alias mv='mv -i'
alias rm='trash -v' # using safer trash-cli
alias mkdir='mkdir -p' # auto create parent dir/s

alias ll='lsd -l' # long format (lsd has default -h)
alias la='lsd -A' # hidden files exluding . & ..
alias lla='lsd -lA'
alias lr='lsd -lR' # recursive
alias lf='lsd -l | egrep -v "^d"'  # files only
alias ldir='lsd -l | egrep "^d"'   # directories only

alias atree='lsd --tree --all --ignore-glob .git --ignore-glob __pycache__'
alias bat='batcat'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

alias fd='fdfind'
alias fh='fd -H'      # include hidden
# Search files in the current folder
# alias f='find . | grep '

# Change directory aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Popular programs shortcuts
alias ff='fastfetch'
alias svim='sudo vim'
alias snvim='sudo nvim'

# Power commands
alias gomommy='systemctl suspend'
alias godaddy='systemctl suspend-then-hibernate'
alias papi='sudo shutdown now'
alias phoenix='sudo reboot'


alias reload='source ~/.bashrc'
alias nala-up='sudo nala update && sudo nala upgrade'
alias gitlog='git log --oneline --decorate --graph --parents'
alias docker-clear-containers='docker stop $(docker ps -aq) && docker rm $(docker ps -aq)'
alias nf='file=$(find . -type f -not -path "*/node_modules/*" -not -path "*/__pycache__/*" -not -path "*/.git/*" | fzf --height 40% --layout=reverse --border --preview "head -50 {}") && nvim "$file"'

# Alias's for archives
# alias mktar='tar -cvf'
# alias mkbz2='tar -cvjf'
# alias mkgz='tar -cvzf'
# alias untar='tar -xvf'
# alias unbz2='tar -xvjf'
# alias ungz='tar -xvzf'
