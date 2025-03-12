-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<D-s>", ":w<CR>", { desc = "Save file", silent = true })
vim.keymap.set("i", "<D-s>", "<Esc>:w<CR>a", { desc = "Save file", silent = true })
vim.g.neovide_input_macos_option_key_is_meta = "only_left"
if vim.g.neovide then
  -- Enable Command key mappings
  vim.g.neovide_input_use_logo = true -- Enable the Command/Super/Windows key
end
