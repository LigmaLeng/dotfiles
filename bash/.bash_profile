#
# ~/.bash_profile
#

# To allow global installation of npm packages
export PATH="${HOME}/.local/bin:${PATH}"
export PATH=$PATH:/home/ligmaleng/.spicetify

[[ -f ${HOME}/.bashrc ]] && . ${HOME}/.bashrc

if uwsm check may-start; then
	exec uwsm start hyprland.desktop
fi
