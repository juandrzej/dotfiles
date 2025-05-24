# Change directory aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias nala-up="sudo nala update && sudo nala upgrade"
alias gitlog="git log --oneline --decorate --graph --parents"
alias ff="fastfetch"
alias godaddy="systemctl suspend-then-hibernate"
alias gomommy="systemctl suspend"
alias gopapi="sudo shutdown now"

alias docker-clear-containers="docker stop $(docker ps -aq) && docker rm $(docker ps -aq)"

