return {
	{
		"mikavilpas/yazi.nvim",
		version = "*", -- use the latest stable version
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		opts = {
			open_for_directories = false,
			open_multiple_tabs = false,
			change_neovim_cwd_on_close = false,
			highlight_groups = {
				hovered_buffer = nil,
				hovered_buffer_in_same_directory = nil,
			},
			-- the floating window scaling factor. 1 means 100%, 0.9 means 90%, etc.
			floating_window_scaling_factor = 0.9,

			-- the transparency of the yazi floating window (0-100). See :h winblend
			yazi_floating_window_winblend = 0,

			-- the type of border to use for the floating window. Can be many values,
			-- including 'none', 'rounded', 'single', 'double', 'shadow', etc. For
			-- more information, see :h nvim_open_win
			yazi_floating_window_border = "shadow",

			-- the zindex of the yazi floating window. Can be used to make the yazi
			-- window fullscreen. See `:h nvim_open_win()` for more information.
			yazi_floating_window_zindex = nil,

			log_level = vim.log.levels.OFF,

			-- Defaults to simply opening the file.
			open_file_function = function(chosen_file, config, state) end,

			keymaps = {
				show_help = "<f1>",
				open_file_in_vertical_split = "<c-v>",
				open_file_in_horizontal_split = "<c-x>",
				open_file_in_tab = "<c-t>",
				replace_in_directory = "<c-g>",
				cycle_open_buffers = "<tab>",
				copy_relative_path_to_selected_files = "<c-y>",
				send_to_quickfix_list = "<c-q>",
				change_working_directory = "<c-\\>",
				open_and_pick_window = "<c-o>",
			},

			-- completely override the keymappings for yazi. This function will be
			-- called in the context of the yazi terminal buffer.
			set_keymappings_function = function(yazi_buffer_id, config, context) end,

			-- some yazi.nvim commands copy text to the clipboard. This is the register
			-- yazi.nvim should use for copying. Defaults to "*", the system clipboard
			clipboard_register = "*",

			hooks = {
				-- if you want to execute a custom action when yazi has been opened,
				-- you can define it here.
				yazi_opened = function(preselected_path, yazi_buffer_id, config)
					-- you can optionally modify the config for this specific yazi
					-- invocation if you want to customize the behaviour
				end,

				-- when yazi was successfully closed
				yazi_closed_successfully = function(chosen_file, config, state) end,

				-- when yazi opened multiple files. The default is to send them to the
				-- quickfix list, but if you want to change that, you can define it here
				yazi_opened_multiple_files = function(chosen_files, config, state) end,

				-- This function is called when yazi is ready to process events.
				on_yazi_ready = function(buffer, config, process_api) end,

				before_opening_window = function(window_options) end,
			},

			-- highlight buffers in the same directory as the hovered buffer
			highlight_hovered_buffers_in_same_directory = true,

			integrations = {
				resolve_relative_path_application = "realpath",

				-- the way to resolve relative paths. The default_implementation can be
				-- customized with a function. See
				-- documentation/copy-relative-path-to-files.md for more information.
				resolve_relative_path_implementation = function(args, get_relative_path) end,

				bufdelete_implementation = "bundled-snacks",

				picker_add_copy_relative_path_action = "snacks.picker",
			},

			future_features = {
				-- use a file to store the last directory that yazi was in before it was
				-- closed. Defaults to `true`.
				use_cwd_file = true,

				-- use a new shell escaping implementation that is more robust and works
				-- on more platforms. Defaults to `true`. If set to `false`, the old
				-- shell escaping implementation will be used, which is less robust and
				-- may not work on all platforms.
				new_shell_escaping = true,
			},
		},
	},
	{
		-- example: include a flavor from a subdirectory. There are lots of flavors
		-- available in https://github.com/yazi-rs/flavors
		"yazi-rs/flavors",
		name = "yazi-rs-flavors",
		lazy = true,
		build = function(spec)
			require("yazi.plugin").build_flavor(spec, {
				sub_dir = "catppuccin-mocha.yazi",
			})
			require("yazi.plugin").build_flavor(spec, {
				sub_dir = "dracula.yazi",
			})
		end,
	},
	{
		"Miuzarte/synthwave84.yazi",
		lazy = true,
		build = function(plugin)
			require("yazi.plugin").build_flavor(plugin)
		end,
	},
	{
		"dangooddd/kanagawa.yazi",
		lazy = true,
		build = function(plugin)
			require("yazi.plugin").build_flavor(plugin)
		end,
	},
	{
		"yazi-rs/plugins",
		name = "yazi-rs-plugins",
		lazy = true,
		build = function(plugin)
			require("yazi.plugin").build_plugin(plugin, { sub_dir = "types.yazi" })
			require("yazi.plugin").build_plugin(plugin, { sub_dir = "full-border.yazi" })
		end,
	},
}
