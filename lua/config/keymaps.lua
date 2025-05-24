-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map_nv(lhs, rhs, opts)
  local modes = { "n", "v" }
  for _, mode in ipairs(modes) do
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
local function map_all_mode(lhs, rhs, opts)
  map_nv(lhs, rhs, opts)
  vim.keymap.set("i", lhs, rhs, opts)
end
map_nv("<BS>", '"_d', { desc = "Delete selection with Del" })
map_all_mode("<F5>", function()
  require("dap").continue()
end, { desc = "DAP: Continue" })
map_all_mode("<F10>", function()
  require("dap").step_over()
end, { desc = "DAP: Step Over" })
map_all_mode("<F11>", function()
  require("dap").step_into()
end, { desc = "DAP: Step Into" })
map_all_mode("<F12>", function()
  require("dap").step_out()
end, { desc = "DAP: Step Out" })
vim.keymap.set("n", "\\b", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })
if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("i", "<D-s>", "<C-O>:w<CR>")
  vim.keymap.set("n", "<D-w>", ":CloseBuffer<CR>") -- Close
  vim.keymap.set("i", "<D-w>", "<C-o>:CloseBuffer<CR>") -- Close
  vim.keymap.set("i", "<D-z", function()
    vim.cmd("undo")
  end)
  map_nv("<D-v>", '"+gP', { desc = "Paste from clipboard" })
  vim.keymap.set("c", "<D-v>", "<C-r>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", "<C-r>+", { noremap = true, silent = true })
  vim.keymap.set("v", "<D-c>", '"+y', { desc = "Copy to clipboard in visual mode" })
  vim.keymap.set("v", "<D-x>", '"+d', { desc = "Cut to clipboard" })
  map_nv("<D-a>", "gg<S-v>G", { desc = "Select all" })
end
