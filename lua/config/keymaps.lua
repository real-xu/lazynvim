-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- -- Add any additional keymaps here
--
-- vim.api.nvim_set_keymap(
--   "n", -- Normal mode
--   "<leader>Sk", -- The key combination
--   "<cmd>SomeCommandName<CR>", -- Replace "SomeCommandName" with your desired command
--   { noremap = true, silent = true }
-- )


vim.api.nvim_set_keymap(
  "n",
  "<leader>qw",
  "<cmd>SessionManager save_current_session<CR>",
  { noremap = true, silent = true }
)

