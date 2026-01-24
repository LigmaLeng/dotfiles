#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# The function will only add directories that actually exist on the filesystem,
# and avoid creating duplicate entries
prepend_paths() {
	for d in "$@"; do
		[[ -d "$d" && ! "$PATH" =~ (^|:)$d(:|$) ]] && PATH="$d:$PATH"
	done
}

# yazi shell wrapper
y() {
	local tmp cwd
	tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Configure environment variables and aliases for color terminals
alias grep='grep --color=auto' diff='diff --color=auto' ip='ip -color=auto' ls='ls -Cw $COLUMNS --color=auto'
export MANROFFOPT='-P -c'
export MANPAGER='nvim +Man!'
export LESS='-R -Dd+r -Dd+r -Du+g'

# Shorthands for ls
alias ll='ls -l' la='ls -A' lla='ls -lA'

# Define colors for ls
if [[ -f ${XDG_CONFIG_HOME}/dircolors ]]; then
	eval "$(dircolors ${XDG_CONFIG_HOME}/dircolors)"
else
	eval "$(dircolors)"
fi

# XDG BASE DIRECTORIES
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export W3M_DIR="$XDG_CONFIG_HOME"/w3m

# Set default terminal editor and alias
export TERMINAL=/usr/bin/kitty
export VISUAL=nvim
export EDITOR=nvim
alias vi=nvim
alias vick='nvim $XDG_CONFIG_HOME/kitty/kitty.conf'
alias vich='nvim $XDG_CONFIG_HOME/hypr/hyprland.conf'

# git
alias gs="git status" ga="git add" gc="git commit -m" gp="git push" gpl="git pull" gst="git stash"
alias gsp="git stash; git pull" gfo="git fetch origin" gch="git checkout" gsw="git switch"

# systemd-run0
alias r="run0 --background=''"

# Configure pinentry to use the correct TTY
GPG_TTY=$(tty)
export GPG_TTY
gpg-connect-agent updatestartuptty /bye >/dev/null

# History
export HISTFILE="$XDG_STATE_HOME"/bashhst
export HISTCONTROL=ignoreboth

# CUDA
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

# RUSTUP
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

prepend_paths "$HOME/.local/bin" "$HOME/.config/composer/vendor/bin" "$XDG_DATA_HOME/cargo/bin/"

# Starship prompt init
eval "$(starship init bash)"

# Print fastfetch info if in a pseudo-terminal
[[ $(tty) == *"pts"* ]] && fastfetch
