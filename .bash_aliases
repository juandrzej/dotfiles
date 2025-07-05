# Alias's to modified commands
alias cp='cp -i' # prompt before overwriting files
alias mv='mv -i'
alias rm='trash -v' # using safer trash-cli
alias mkdir='mkdir -p' # auto create parent dir/s

alias ls='lsd'
alias ll='lsd -l' # long format (lsd has default -h)
alias la='lsd -A' # hidden files exluding . & ..
alias lla='lsd -lA'
alias lr='lsd -lR' # recursive
alias lf="lsd -l | egrep -v '^d'"  # files only
alias ldir="lsd -l | egrep '^d'"   # directories only

alias atree='lsd --tree --all --ignore-glob .git --ignore-glob __pycache__'
alias bat='batcat'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Search files in the current folder
alias f='find . | grep '

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
alias gomommy="systemctl suspend"
alias godaddy="systemctl suspend-then-hibernate"
alias papi="sudo shutdown now"
alias phoenix="sudo reboot"


alias nala-up="sudo nala update && sudo nala upgrade"
alias gitlog="git log --oneline --decorate --graph --parents"
alias docker-clear-containers="docker stop $(docker ps -aq) && docker rm $(docker ps -aq)"

# Alias's for archives
# alias mktar='tar -cvf'
# alias mkbz2='tar -cvjf'
# alias mkgz='tar -cvzf'
# alias untar='tar -xvf'
# alias unbz2='tar -xvjf'
# alias ungz='tar -xvzf'
