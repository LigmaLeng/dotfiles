-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- half page up/down
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half Page Up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half Page Down" })

-- insert lines
vim.keymap.set("n", "O", "O<esc>", { desc = "Insert Line Above" })
vim.keymap.set("n", "o", "o<esc>", { desc = "Insert Line Below" })

-- navigate paragraph
vim.keymap.set("n", "{", "{zz", { desc = "Previous Paragraph" })
vim.keymap.set("n", "}", "}zz", { desc = "Next Paragraph" })

-- focused searching
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zzzv'", { expr = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zzzv'", { expr = true, desc = "Prev Search Result" })

--  emacs-style insert mode
vim.keymap.set("i", "<C-a>", "<Home>", { desc = "Start of Line" })
vim.keymap.set("i", "<C-b>", "<Left>", { desc = "Left" })
vim.keymap.set("i", "<C-d>", "<Del>", { desc = "Delete" })
vim.keymap.set("i", "<A-d>", "<C-O>de", { desc = "Delete Word" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "End of Line" })
vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Right" })
vim.keymap.set("i", "<A-b>", "<S-Left>", { desc = "Left One word" })
vim.keymap.set("i", "<A-f>", "<S-Right>", { desc = "Right One word" })
vim.keymap.set("i", "<A-n>", "<C-N>", { desc = "Next Suggestion" })
vim.keymap.set("i", "<A-p>", "<C-P>", { desc = "Previous Suggestion" })
vim.keymap.set("i", "<C-n>", "<Down>", { desc = "Down" })
vim.keymap.set("i", "<C-p>", "<Up>", { desc = "Up" })

-- emacs-style command mode
vim.keymap.set("c", "<C-a>", "<Home>", { desc = "Start of Line" })
vim.keymap.set("c", "<C-b>", "<Left>", { desc = "Left" })
vim.keymap.set("c", "<C-d>", "<Del>", { desc = "Delete" })
vim.keymap.set("c", "<C-e>", "<End>", { desc = "End of Line" })
vim.keymap.set("c", "<C-f>", "<Right>", { desc = "Right" })
vim.keymap.set("c", "<C-n>", "<Down>", { desc = "Down" })
vim.keymap.set("c", "<C-p>", "<Up>", { desc = "Up" })
vim.keymap.set("c", "<A-b>", "<S-Left>", { desc = "Left One word" })
vim.keymap.set("c", "<A-f>", "<S-Right>", { desc = "Right One word" })

--  yank-pasting
vim.keymap.set("n", "Y", "yg$", { desc = "Yank up to End of Line" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank to Clipboard" })
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank to Clipboard" })
vim.keymap.set("n", "<leader>y", "\"+Y", { desc = "Yank to Clipboard" })

--  void-registers
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Void Paste" })
vim.keymap.set("n", "<leader>d", "\"_d", { desc = "Void Delete" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "Void Delete" })

-- save file
vim.keymap.set("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Save File" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>qa", "<cmd>qa<cr>", { desc = "Quit All" })
