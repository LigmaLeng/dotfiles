return {
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			---@type snacks.picker.explorer.Config
			explorer = {
				auto_close = true,
			},
			---@type snacks.picker.Config
			picker = {
				sources = {
					explorer = { layout = { layout = { width = 25 } } },
				},
			},
		},
		keys = {
			{ "<leader>E", false },
			{ "<leader>fE", false },
			{
				"<leader>fe",
				function()
					Snacks.explorer()
				end,
				desc = "Explorer Snacks (cwd)",
			},
			{
				"<leader>e",
				function()
					Snacks.explorer({ cwd = LazyVim.root() })
				end,
				desc = "Explorer Snacks (root dir)",
			},
			{
				"<leader>sps",
				function()
					Snacks.picker.lazy()
				end,
				desc = "Search for Plugin Spec",
			},
			{
				"<leader>spr",
				function()
					---@type snacks.picker.files.Config
					Snacks.picker.files({
						dirs = { vim.fn.stdpath("data") .. "/lazy" },
						cmd = "fd",
						args = { "--type", "d", "--exact-depth", "1" },
						confirm = function(picker, item, action)
							---@cast action snacks.picker.jump.Action
							picker:close()
							if item and item.file then
								vim.schedule(function()
									local cmd = "cd " .. item.file .. " | ex " .. item.file ---@type string
									if action.cmd == "vsplit" then
										cmd = "vs | l" .. cmd
									elseif action.cmd == "split" then
										cmd = "sp | l" .. cmd
									else
										cmd = "tabnew | t" .. cmd
									end
									vim.cmd(cmd)
								end)
							end
						end,
					})
				end,
				desc = "Search for Plugin Root",
			},
		},
	},
}
