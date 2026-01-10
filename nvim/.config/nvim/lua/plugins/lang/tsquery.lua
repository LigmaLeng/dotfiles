return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			---@type lazyvim.lsp.Config
			servers = {
				ts_query_ls = {},
			},
		},
	},
}
