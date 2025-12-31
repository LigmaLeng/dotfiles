return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							codeLens = {
								enable = true,
							},
							completion = {
								callSnippet = "Replace",
							},
							doc = {
								privateName = { "^_" },
							},
							hint = {
								arrayIndex = "Disable",
								enable = true,
								paramName = "Disable",
								paramType = true,
								semicolon = "Disable",
								setType = false,
							},
							workspace = {
								checkThirdParty = false,
							},
						},
					},
				},
			},
		},
	},
}
