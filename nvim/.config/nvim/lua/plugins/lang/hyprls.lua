return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				hyprls = {
					root_markers = { ".git", "hyprland.conf" },
				},
			},
		},
	},
}
