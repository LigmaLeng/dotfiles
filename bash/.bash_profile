#
# ~/.bash_profile
#

[[ -f ${HOME}/.bashrc ]] && . ${HOME}/.bashrc

if uwsm check may-start; then
	exec uwsm start hyprland.desktop
fi
