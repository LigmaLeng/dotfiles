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

--local view_group = augroup("auto_view")
--vim.api.nvim_create_autocmd("BufWinEnter", {
--  desc = "Try to load file view if available and enable view saving for real files",
--  group = view_group,
--  callback = function(args)
--    if not vim.b[args.buf].view_activated then
--      local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
--      local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
--      local ignore_filetypes = { "gitcommit", "gitrebase", "svg", "hgcommit" }
--      if buftype == "" and filetype and filetype ~= "" and not vim.tbl_contains(ignore_filetypes, filetype) then
--        vim.b[args.buf].view_activated = true
--        vim.cmd.loadview({ mods = { emsg_silent = true } })
--      end
--    end
--  end,
--})
--
--vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWritePost", "WinLeave" }, {
--  desc = "Save view with mkview for real files",
--  group = view_group,
--  callback = function(args)
--    if vim.b[args.buf].view_activated then
--      vim.cmd.mkview({ mods = { emsg_silent = true } })
--    end
--  end,
--})
