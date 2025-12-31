return {
	{
		"saghen/blink.cmp",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		dependencies = {
			"L3MON4D3/LuaSnip",
		},
		opts = {
			keymap = {
				preset = "default",
				["<Up>"] = false,
				["<Down>"] = false,
				["<Tab>"] = {
					function()
						if require("luasnip").choice_active() then
							require("luasnip").change_choice(1)
						end
					end,
					"fallback",
				},
				["<S-Tab>"] = { "fallback" },
				["<C-e>"] = { "hide", "fallback_to_mappings" },
				["<CR>"] = { "select_and_accept", "fallback" },
				["<A-n>"] = { "snippet_forward", "fallback" },
				["<A-p>"] = { "snippet_backward", "fallback" },
				-- ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
				-- ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
				-- ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
				-- ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
				-- ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
				-- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
			},
			signature = { enabled = true },
		},
	},
}
