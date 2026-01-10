return {
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			---@type snacks.picker.Config
			picker = {
				sources = {
					explorer = {
						layout = { layout = { width = 25 } },
						hidden = true,
						ignored = true,
					},
					files = {
						hidden = true,
					},
					keymaps = {
						plugs = true,
					},
				},
			},
			---@type snacks.zen.Config
			zen = {
				toggles = {
					dim = false,
					git_signs = true,
					mini_diff_signs = false,
				},
				show = { statusline = false, tabline = false },
				win = { backdrop = { transparent = false, blend = 99 } },
			},
			---@type snacks.scratch.Config
			scratch = {
				win = { wo = {
					winhighlight = "NormalFloat:Normal",
				}, backdrop = false },
			},
			---@type snacks.animate.Config
			animate = {
				duration = {
					duration = { step = 16, total = 128 },
				}, -- ms
				easing = "outQuint",
				fps = 144, -- frames per second. Global setting for all animations
			},
			---@type snacks.scroll.Config
			scroll = {
				animate = {
					duration = { step = 16, total = 128 },
					easing = "outQuint",
				},
				-- faster animation when repeating scroll after delay
				animate_repeat = {
					delay = 150, -- delay in ms before using the repeat animation
					duration = { step = 8, total = 64 },
					easing = "linear",
				},
			},
			---@type snacks.image.Config
			image = {
				formats = {
					"png",
					"jpg",
					"jpeg",
					"jxl",
					"gif",
					"bmp",
					"webp",
					"tiff",
					"heic",
					"avif",
					"mp4",
					"mov",
					"avi",
					"mkv",
					"webm",
					"pdf",
					"icns",
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
