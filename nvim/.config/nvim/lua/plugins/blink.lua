return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
		},
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "none",
				["<Tab>"] = false,
				["<S-Tab>"] = false,
				["<C-e>"] = { "hide", "fallback_to_mappings" },
				["<CR>"] = { "select_and_accept", "fallback" },
				["<A-n>"] = { "snippet_forward", "fallback" },
				["<A-p>"] = { "snippet_backward", "fallback" },
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-p>"] = { "select_prev", "fallback_to_mappings" },
				["<C-n>"] = { "select_next", "fallback_to_mappings" },
				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			},
			snippets = {
				preset = "luasnip",
			},
			completion = {
				ghost_text = {
					enabled = true,
					show_with_menu = true,
				},
			},
			sources = {
				default = { "snippets", "lsp", "path", "buffer" },
			},
			signature = { enabled = true },
			appearance = {
				kind_icons = {
					Text = "",
					Method = "",
					Function = "󰊕",
					Constructor = "󱊏",

					Field = "",
					Variable = "󰫧",
					Property = "",

					Class = "",
					Interface = "󱄽",
					Struct = "",
					Module = "󰅩",

					Unit = "󰞼",
					Value = "󱃮",
					Enum = "",
					EnumMember = "",

					Keyword = "",
					Constant = "󰏿",

					Snippet = "󰩫",
					Color = "󰸌",
					File = "",
					Reference = "",
					Folder = "",
					Event = "",
					Operator = "",
					TypeParameter = "",
				},
			},
		},
	},
}
