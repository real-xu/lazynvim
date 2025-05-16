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
  "<^P>",
  "<cmd>lua dev_print('Key combo detected!')<CR>",
  { noremap = true, silent = true }
)

-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function()
  require("persistence").load()
end)

-- select a session to load
vim.keymap.set("n", "<leader>qS", function()
  require("persistence").select()
end)

-- load the last session
vim.keymap.set("n", "<leader>ql", function()
  require("persistence").load({ last = true })
end)

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function()
  require("persistence").stop()
end)

vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>")
vim.keymap.set("n", "gR", "<CMD>Glance references<CR>")
vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>")
vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>")

vim.keymap.set("n", "<leader>ri", function()
  require("rulebook").ignoreRule()
end)
vim.keymap.set("n", "<leader>rl", function()
  require("rulebook").lookupRule()
end)
vim.keymap.set("n", "<leader>ry", function()
  require("rulebook").yankDiagnosticCode()
end)
vim.keymap.set({ "n", "x" }, "<leader>rf", function()
  require("rulebook").suppressFormatter()
end)
