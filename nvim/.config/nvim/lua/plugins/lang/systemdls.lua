return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			---@type lazyvim.lsp.Config
			servers = {
				systemd_lsp = {},
			},
		},
	},
}
