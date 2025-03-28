-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps
-- lazy
vim.keymap.set("n", "<leader>m", "<cmd>Lazy<cr>", { desc = "Lazy", noremap = true })

vim.keymap.set("n", "c", '"_c', { noremap = true })
vim.keymap.set("n", "C", '"_C', { noremap = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true })

vim.keymap.set("v", "c", '"_c', { noremap = true })
vim.keymap.set("v", "C", '"_C', { noremap = true })
vim.keymap.set("v", "dd", '"_dd', { noremap = true })

-- Ctrl + d 現在日次を挿入
vim.keymap.set("i", "<C-d>", "<C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR>", { noremap = true })
