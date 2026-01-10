-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local function augroup(name)
	return vim.api.nvim_create_augroup("ligmavim_" .. name, { clear = true })
end

local function enable_foldexpr()
	vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	vim.opt_local.foldmethod = "expr"
	vim.cmd.normal("zx")
end

local fold_group = augroup("foldmethod")
vim.api.nvim_create_autocmd("BufReadPre", {
	group = fold_group,
	callback = function()
		vim.opt_local.foldmethod = "indent"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = fold_group,
	callback = function()
		if not pcall(vim.treesitter.start) then
			return
		end
		enable_foldexpr()
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	group = fold_group,
	callback = function()
		if vim.opt_local.foldmethod == "indent" then
			vim.opt_local.foldmethod = "manual"
		end
	end,
})

local indent_group = augroup("indent")
vim.api.nvim_create_autocmd("FileType", {
	group = indent_group,
	pattern = {
		"css",
		"html",
		"javascript",
		"lua",
		"markdown",
		"md",
		"query",
		"scss",
		"snacks_picker_preview",
		"typescript",
		"vim",
		"xml",
		"xhtml",
		"yaml",
	},
	callback = function()
		vim.opt_local.tabstop = 2
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		_G.dd = function(...)
			Snacks.debug.inspect(...)
		end
		_G.bt = function()
			Snacks.debug.backtrace()
		end

		-- Override print to use snacks for `:=` command
		if vim.fn.has("nvim-0.11") == 1 then
			vim._print = function(_, ...)
				dd(...)
			end
		else
			vim.print = _G.dd
		end
	end,
})
