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
  vim.keymap.set("t", lhs, rhs, opts)
end
-- TODO: make this work
vim.keymap.set("v", "x", '"_x', { noremap = true, desc = "Delete selection with Backspace" })
map_all_mode("<F5>", function()
  require("dap").continue()
end, { desc = "DAP: Continue" })
map_all_mode("<F6>", function()
  require("dap").run_last()
end, { desc = "DAP: Use last config" })
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

-- Now configure shortcuts for MacOS
-- if vim.g.neovide then
vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
vim.keymap.set("i", "<D-s>", "<C-O>:w<CR>")
map_all_mode("<D-w>", function()
  local success, _ = pcall(function() vim.cmd('tabclose') end)
  if not success then
    vim.notify("Cannot close the last tab page", vim.log.levels.WARN)
  end
end, { desc = "Close current tab" })
map_all_mode("<D-z>", function() vim.cmd("undo") end)
vim.keymap.set("i", "<D-v>", '<C-O>"+p')
vim.keymap.set("c", "<D-v>", "<C-R>+")
vim.keymap.set("n", "<D-v>", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("v", "<D-v>", '"_d"+gP', { desc = "Remove the selected part and paste from system clipboard." })
vim.keymap.set("v", "<D-c>", '"+y', { desc = "Copy to clipboard in visual mode" })
vim.keymap.set("v", "<D-x>", '"+d', { desc = "Cut to clipboard" })
map_nv("<D-a>", "gg<S-v>G", { desc = "Select all" })
-- end
