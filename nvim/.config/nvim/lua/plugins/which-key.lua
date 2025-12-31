return {
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{
					mode = { "n", "x" },
					{ "<leader>sp", group = "plugins" },
					{ "<leader>K", icon = { cat = "filetype", name = "man" } },
					{ "<leader>y", hidden = true },
					{ "<leader>Y", hidden = true },
				},
				{ "<leader>E", "<cmd>Yazi cwd<cr>", desc = "Yazi (cwd)", icon = { icon = "󰇥", color = "yellow" } },
			},
		},
	},
}
