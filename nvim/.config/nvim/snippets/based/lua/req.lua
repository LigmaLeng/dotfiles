---@module "luasnip"
return {
	s({
		trig = "req",
		name = "require",
		desc = "Require module",
	}, fmt('require("{}")', { i(1, "modname") })),
	s({
		trig = "lreq",
		name = "locreq",
		desc = "Require module as a variable",
	}, fmt('local {} = require("{}")', { i(1, "modname"), rep(1) })),
	s({
		trig = "rt",
		name = "return",
		desc = "Return value",
	}, fmt("return {}", { i(1) })),
	s({
		trig = "ll",
		name = "assigment",
		desc = "Define a variable",
	}, fmt("local {} = {}", { i(1, "varname"), i(2, "value") })),
	s({
		trig = "l",
		name = "local",
		desc = "Declare a variable",
	}, fmt("local {}", { i(1, "module") })),
	s(
		{
			trig = "cl",
			name = "class",
			desc = "Create a class",
		},
		fmt(
			[[
        {} = {{}}
        {}.{} = function({})
          {}
        end
      ]],
			{ i(1, "M"), rep(1), i(2, "new"), i(3), i(4) },
			{ indent_string = "  " }
		)
	),
	s(
		{
			trig = "for",
			name = "for",
			desc = "for statement",
		},
		fmt(
			[[
        for {} do
          {}
        end
      ]],
			{ i(1), i(2) },
			{ indent_string = "  " }
		)
	),
	s(
		{
			trig = "forn",
			name = "for-numeric",
			desc = "for numeric range statement",
		},
		fmt(
			[[
        for {} = {}, {} do
          {}
        end
      ]],
			{ i(1, "i"), i(2, "1"), i(3, "10"), i(0) },
			{ indent_string = "  " }
		)
	),
	s(
		{
			trig = "fori",
			name = "for-ipairs",
			desc = "for i, x in ipairs(t)",
		},
		fmt(
			[[
        for {}, {} in ipairs({}) do
          {}
        end
      ]],
			{ i(1, "i"), i(2, "x"), i(3, "t"), i(0) },
			{ indent_string = "  " }
		)
	),
	s(
		{
			trig = "forp",
			name = "for-pairs",
			desc = "for k, v in pairs(t)",
		},
		fmt(
			[[
        for {}, {} in pairs({}) do
          {}
        end
      ]],
			{ i(1, "k"), i(2, "v"), i(3, "t"), i(0) },
			{ indent_string = "  " }
		)
	),
	s(
		{
			trig = "forline",
			name = "forline",
			desc = "Read file line by line",
		},
		fmt(
			[[
        local {} = io.open({}, "{}")
        while true do
          line = {}:read()
          if line == nil then break end
          {}
        end
	    ]],
			{
				i(1, "f"),
				i(2, "filename"),
				i(3, "r"),
				rep(1),
				i(0),
			},
			{ indent_string = "  " }
		)
	),
	s({
		trig = "fu",
		name = "function",
		desc = "Define a function",
	}, fmt("function {}({})\n\t{}\nend", { i(1, "name"), i(2), i(0) }, { indent_string = "\t" })),
	s({
		trig = "f=",
		name = "assign-function",
		desc = "Assign a function to a variable",
	}, fmt("{} = function({})\n\t{}\nend", { i(1, "name"), i(2), i(0) }, { indent_string = "\t" })),
	s({
		trig = "lfu",
		name = "local-function",
		desc = "Define a local function",
	}, fmt("local function {}({})\n\t{}\nend", { i(1, "name"), i(2), i(0) }, { indent_string = "\t" })),
	s({
		trig = "lf=",
		name = "local-assign-function",
		desc = "Assign a function to a local variable",
	}, fmt("local {} = function({})\n\t{}\nend", { i(1, "name"), i(2), i(0) }, { indent_string = "\t" })),
	s({
		trig = "f)",
		name = "anonymous-function",
		desc = "Create an anonymous function",
	}, fmt("function({})\n\t${}\nend", { i(1), i(0) }, { indent_string = "\t" })),
	s({
		trig = "f,",
		name = "member-function",
		desc = "Assign a function to a table key",
	}, fmt("{} = function({})\n\t{}\nend", { i(1, "name"), i(2), i(0) }, { indent_string = "\t" })),
	s({
		trig = "pca",
		name = "pcall",
		desc = "Protect call a function",
	}, fmt("pcall({})", { i(0, "function") })),
	s({
		trig = "lpca",
		name = "locpcall",
		desc = "Protect call a function as a variable",
	}, fmt("local {}, {} = pcall({})", { i(1, "status"), i(2, "err_or_value"), i(0, "function") })),
}
