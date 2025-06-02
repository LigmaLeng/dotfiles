#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# The function will only add directories that actually exist on the filesystem,
# and avoid creating duplicate entries
add_paths() {
	for d in "$@"; do
		[[ -d "$d" && ! "$PATH" =~ (^|:)$d(:|$) ]] && PATH="$PATH:$d"
	done
}

# yazi shell wrapper
y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

add_paths "$HOME/.local/bin" "$HOME/.spicetify" "$HOME/.config/composer/vendor/bin"

# Configure environment variables and aliases for color terminals
alias grep='grep --color=auto' diff='diff --color=auto' ip='ip -color=auto' ls='ls -Cw $COLUMNS --color=auto'
if [[ "$TERM" != "dumb" ]]; then
	export LESS='-c -R --use-color -Dd+r -Du+g'
	export MANROFFOPT='-P -c'
fi

# Shorthands for ls
alias ll='ls -l' la='ls -A' lla='ls -lA'

# Define colors for ls
if [[ -f ~/.config/dircolors ]]; then
	eval "$(dircolors "$XDG_CONFIG_HOME"/dircolors)"
else
	eval "$(dircolors)"
fi

# Set default editor and alias
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.lua" | so $MYVIMRC'
export EDITOR=nvim
alias vi=nvim

# Configure pinentry to use the correct TTY
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# CUDA
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

# History
export HISTFILE="$XDG_STATE_HOME"/bashhst
export HISTCONTROL=ignoreboth

# git
alias gs="git status" ga="git add" gc="git commit -m" gp="git push" gpl="git pull" gst="git stash"
alias gsp="git stash; git pull" gfo="git fetch origin" gch="git checkout" gsw="git switch"

# Starship prompt init
eval "$(starship init bash)"

# Print fastfetch info if in a pseudo-terminal
[[ $(tty) == *"pts"* ]] && fastfetch
