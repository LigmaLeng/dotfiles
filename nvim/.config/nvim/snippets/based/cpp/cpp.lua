---@module "luasnip"
return {
	----------------------------------------------------------------------
	--													 Preprocessor														--
	----------------------------------------------------------------------

	-- #ifndef
	s(
		{
			trig = "pragonce",
			name = "include guard",
			desc = "Header include guard",
		},
		fmt(
			[[
			#pragma once
			#ifndef {}_H
			#define {}_H
			{}

			#endif // {}_H
			]],
			{ i(1, "FILE"), rep(1), i(0), rep(1) }
		)
	),
}
