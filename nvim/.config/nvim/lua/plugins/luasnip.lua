local snipath = vim.fn.stdpath("config") .. "/snippets"

return {
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		dependencies = {
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load({
						exclude = { "c", "cdoc", "cpp", "cppdoc", "lua", "luadoc" },
					})
					require("luasnip.loaders.from_vscode").lazy_load({
						paths = { snipath .. "/chopped" },
					})
					require("luasnip.loaders.from_lua").lazy_load({
						paths = { snipath .. "/based" },
					})
				end,
			},
		},
		opts = {
			-- equivalent to deprecated opts.history
			keep_roots = true,
			link_roots = true,
			link_children = true,
			exit_roots = false,

			delete_check_events = "TextChanged",
			update_events = "TextChanged,TextChangedI",
			ext_opts = {
				[require("luasnip.util.types").choiceNode] = {
					active = {
						virt_text = { "", "enum" },
					},
				},
			},
		},
	},
}
