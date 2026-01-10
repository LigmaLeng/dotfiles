return {
	{
		"nat-418/boole.nvim",
		keys = {
			{ "<C-a>", mode = { "n", "v" }, "<cmd>Boole increment<cr>", desc = "Boole Extended Increment" },
			{ "<C-x>", mode = { "n", "v" }, "<cmd>Boole decrement<cr>", desc = "Boole Extended Decrement" },
		},
		opts = {
			mappings = {},
			-- User defined loops
			additions = {
				{ "Foo", "Bar" },
				{ "tic", "tac", "toe" },
			},
			allow_caps_additions = {
				{ "true", "false" },
				{ "yes", "no" },
				{ "on", "off" },
				{ "enabled", "disabled" },
				{ "enable", "disable" },
				-- enable → disable
				-- Enable → Disable
				-- ENABLE → DISABLE
			},
		},
	},
}
