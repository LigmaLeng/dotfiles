---@module "luasnip"
return {
	----------------------------------------------------------------------
	--                           Preprocessor                           --
	----------------------------------------------------------------------
	s(
		{
			trig = "prgo",
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
			{
				d(1, function(_, snip)
					return sn(nil, t(string.upper(snip.env.TM_FILENAME_BASE)))
				end, {}),
				rep(1),
				i(0),
				rep(1),
			}
		)
	),
	s(
		{
			trig = "nocpp",
			name = "extern C",
			desc = "Disable C++ name mangling in C headers",
		},
		fmt(
			[[
        #ifdef __cplusplus
        extern "C" {{
        #endif
        {}

        #ifdef __cplusplus
        }} // extern C
        #endif
      ]],
			{ i(0) }
		)
	),
}
