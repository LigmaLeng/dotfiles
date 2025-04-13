#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Configure environment variables and aliases for color terminals
if [[ "$TERM" != "dumb" ]]; then
	export LESS='-c -R --use-color -Dd+r -Du+g'
	export MANROFFOPT='-P -c'
	alias grep='grep --color=auto'
	alias diff='diff --color=auto'
	alias ls='ls -Cw $COLUMNS --color=auto'
	alias ip='ip -color=auto'
else
	alias ls='ls -Cw $COLUMNS'
fi

# Shorthands for ls
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'

if [[ -f ~/.config/dircolors ]]; then
	eval "$(dircolors -b ~/.config/dircolors)"
else
	eval "$(dircolors -b)"
fi

# Set default editor and alias
export EDITOR=nvim
alias vi=nvim

# Configure pinentry to use the correct TTY
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

eval "$(starship init bash)"

[[ $(tty) == *"pts"* ]] && fastfetch
