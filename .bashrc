# If not running interactively, don't do anything (exit early)
case $- in
    *i*) ;;
      *) return;;
esac

# Shell options
set -o vi                    # vi mode
shopt -s histappend          # Append history instead of overwriting
shopt -s checkwinsize        # Update LINES and COLUMNS after each command
shopt -s globstar            # Enable ** recursive globbing

# Expand the history size
HISTFILESIZE=10000
HISTSIZE=500
HISTTIMEFORMAT="%F %T " # Add timestamp to history
HISTCONTROL=ignoreboth # ignoreboth = ignoredups:ignorespace
# HISTCONTROL=erasedups:ignoredups:ignorespace  # Remove all duplicates + space protection
PROMPT_COMMAND='history -a'  # Save history after every command

# Ignore case on auto-completion
bind "set completion-ignore-case on"
# Show auto-completion list automatically, without double tab
bind "set show-all-if-ambiguous On"

# Set the default editor
if command -v nvim &> /dev/null; then
    export EDITOR=nvim
    export VISUAL=nvim
else
    export EDITOR=vim
    export VISUAL=vim
fi

# Enable bash programmable completion features in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable color support for traditional tools (fallback)
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Set PATH for user binaries
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# For nala completions
[ -f "$HOME/.bash_completions/nala.sh" ] && source "$HOME/.bash_completions/nala.sh"

# GitHub Titus Additions
gcom() {
	git add .
	git commit -m "$1"
}
lazyg() {
	git add .
	git commit -m "$1"
	git push
}

# Setup fzf key bindings and fuzzy completion starship (command prompt) and zoxide (better cd)
eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(fzf --bash)"
source ~/.config/fzf/tokyonight_storm.sh

# If fastfetch installed, run it
# if command -v fastfetch &> /dev/null; then
#     fastfetch
# fi

# Use custom nvim for man pages
export MANPAGER="nvim -u ~/.config/nvim-man/init.lua +Man!"
