---@module "luasnip"
return {
	----------------------------------------------------------------------
	--                           Preprocessor                           --
	----------------------------------------------------------------------
	s(
		{
			trig = "pragmaonce",
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
	s(
		{
			trig = "#stdint",
			name = "custom stdint",
			desc = "fixed width typedefs",
		},
		t({
			"typedef signed char        i8;",
			"typedef signed short       i16;",
			"typedef signed int         i32;",
			"typedef signed long long   i64;",
			"",
			"typedef unsigned char      u8;",
			"typedef unsigned short     u16;",
			"typedef unsigned int       u32;",
			"typedef unsigned long long u64;",
			"",
			"typedef signed char        b8;",
			"typedef signed int         b32;",
		})
	),
	s({
		trig = "#gnu",
		name = "gnu source",
		desc = "GNU feature test macros",
	}, t("#define _GNU_SOURCE")),
},
----------------------------------------------------------------------
--														autosnippets													--
----------------------------------------------------------------------
{
	s({
		trig = ";inca",
		name = "include system header",
		desc = "#include <...>",
	}, fmt("#include <{}>", { i(0) })),
	s({
		trig = ";incq",
		name = "include local header",
		desc = '#include "..."',
	}, fmt('#include "{}"', { i(0) })),
	s(
		{
			trig = ";imv",
			name = "void main fn",
			desc = "main() w/o args",
		},
		fmta(
			[[
				int main (void)
				{
					<>
					return 0;
				}
			]],
			{ i(0) }
		)
	),
	s(
		{
			trig = ";imcv",
			name = "main fn",
			desc = "main() with args",
		},
		fmta(
			[=[
				int main (int argc, char *argv[])
				{
					<>
					return 0;
				}
			]=],
			{ i(0) }
		)
	),
	s({
		trig = ";pdm",
		name = "PP def macro",
		desc = "Preprocessor macro",
	}, fmt("#define {}", { i(0, "MACRO") })),
	s({
		trig = ";pdf",
		name = "PP def fn",
		desc = "Preprocessor macro function",
	}, fmt("#define {}({}) ({})", { i(1, "MACRO"), i(2), i(0) })),
	s({
		trig = ";pe",
		name = "PP err",
		desc = "Preprocessor error",
	}, fmt('#error "{}"', { i(0) })),
	s({
		trig = ";pw",
		name = "PP warn",
		desc = "Preprocessor warn",
	}, fmt('#warning "{}"', { i(0) })),
	s(
		{
			trig = ";piff",
			name = "PP if",
			desc = "Preprocessor if",
		},
		fmt(
			[[
				#if {}
					{}
				#endif
			]],
			{ i(1, "0"), i(0) }
		)
	),
	s(
		{
			trig = ";pifd",
			name = "PP ifdef",
			desc = "Preprocessor if defined",
		},
		fmt(
			[[
				#ifdef {}
					{}
				#endif
			]],
			{ i(1, "0"), i(0) }
		)
	),
	s(
		{
			trig = ";pifn",
			name = "PP ifndef",
			desc = "Preprocessor if !defined",
		},
		fmt(
			[[
				#ifndef {}
					{}
				#endif
			]],
			{ i(1, "0"), i(0) }
		)
	),
	s(
		{
			trig = ";iff",
			name = "if",
			desc = "expr &&",
		},
		fmta(
			[[
				if(<>)
				{
					<>
				}<>
			]],
			{ i(1, "0"), i(2), i(0) }
		)
	),
	s(
		{
			trig = ";ife",
			name = "if else",
			desc = "expr && \\ ||",
		},
		fmta(
			[[
				if(<>)
				{
					<>
				}
				else
				{
					<>
				}<>
			]],
			{ i(1, "0"), i(2), i(3), i(0) }
		)
	),
	s(
		{
			trig = ";el",
			name = "else",
			desc = "|| statement",
		},
		fmta(
			[[
				else
				{
					<>
				}<>
			]],
			{ i(1, "0"), i(0) }
		)
	),
	s(
		{
			trig = ";elff",
			name = "else if",
			desc = "||expr &&",
		},
		fmta(
			[[
				else if(<>)
				{
					<>
				}<>
			]],
			{ i(1, "0"), i(2), i(0) }
		)
	),
	s(
		{
			trig = ";ifi",
			name = "if inline",
			desc = "expr && <CR>...",
		},
		fmta(
			[[
				if(<>)
					<>
			]],
			{ i(1, "0"), i(0) }
		)
	),
	s(
		{
			trig = ";elfi",
			name = "else if inline",
			desc = "|| expr && <CR>...",
		},
		fmta(
			[[
				else if(<>)
					<>
			]],
			{ i(1, "0"), i(0) }
		)
	),
}
