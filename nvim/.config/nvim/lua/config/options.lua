-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.maplocalleader = ","
vim.keymap.del({ "s", "i" }, "<Tab>")
vim.keymap.del({ "s", "i" }, "<S-Tab>")

--
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.g.snacks_animate = false
vim.g.ai_cmp = false

-- set to `true` to follow the main branch
-- you need to have a working rust toolchain to build the plugin
-- in this case.
vim.g.lazyvim_blink_main = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.timeoutlen = 200

vim.o.iskeyword = "@,48-57,_,192-255,-" -- Treat dash as `word` textobject part
