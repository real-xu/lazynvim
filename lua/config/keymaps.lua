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
-- vim.keymap.set("v", "<BS>", function()
--   vim.print("Pressed"); vim.cmd('d _<CR>')
-- end, { noremap = true, desc = "Backspace in normal mode" })
vim.keymap.set("v", "x", '"_x', { noremap = true, desc = "Delete selection with Backspace" })
map_all_mode("<F5>", function()
  require("dap").continue()
end, { desc = "Dap: Continue" })
map_all_mode("<F6>", function()
  require("dap").run_last()
end, { desc = "Dap: Use last config" })
map_all_mode("<F10>", function()
  require("dap").step_over()
end, { desc = "Dap: Step Over" })
map_all_mode("<F11>", function()
  require("dap").step_into()
end, { desc = "Dap: Step Into" })
map_all_mode("<F12>", function()
  require("dap").step_out()
end, { desc = "Dap: Step Out" })
vim.keymap.set("n", "\\b", function()
  require("dap").toggle_breakpoint()
end, { desc = "Dap: Toggle Breakpoint" })
vim.keymap.set("n", "\\dr", function()
  require("dap").repl.open()
end, { desc = "Dap: Open REPL" })
vim.keymap.set({ "n", "v" }, "\\dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "Print variable (Hover Mode)" })
vim.keymap.set({ "n", "v" }, "\\dp", function()
  require("dap.ui.widgets").preview()
end, { desc = "Print variable (Preview Mode)" })

-- Now configure shortcuts for MacOS
-- if vim.g.neovide then
map_all_mode("<D-s>", '<Cmd>w<CR>') -- Save
map_all_mode("<D-w>", function()
  local success, _ = pcall(function() vim.cmd('tabclose') end)
  if not success then
    vim.notify("Cannot close the last tab page", vim.log.levels.WARN)
  end
end, { desc = "Close current tab" })
map_all_mode("<D-z>", function() vim.cmd("undo") end)
vim.keymap.set("i", "<D-v>", '<C-O>"+P')
vim.keymap.set("c", "<D-v>", "<C-R>+")
vim.keymap.set("n", "<D-v>", '"+P', { desc = "Paste from clipboard" })
vim.keymap.set("v", "<D-v>", '"_d"+gP', { desc = "Remove the selected part and paste from system clipboard." })
vim.keymap.set("v", "<D-c>", '"+y', { desc = "Copy to clipboard in visual mode" })
vim.keymap.set("v", "<D-x>", '"+d', { desc = "Cut to clipboard" })
map_nv("<D-a>", "gg<S-v>G", { desc = "Select all" })
-- end
-- Set the keymap <leader>fg to trigger the picker
-- vim.keymap.set("n", "<leader>fg", function()
--   local Snacks = require("snacks")
--   return Snacks.picker({
--     finder = "lsp_symbols", -- Use the LSP symbols as the source
--     layout = {
--       layout = {
--         box = "horizontal",
--         width = 0.5,
--         height = 0.5,
--         {
--           box = "vertical",
--           border = "rounded",
--           title = "Find directory",
--           { win = "input", height = 1,     border = "bottom" },
--           { win = "list",  border = "none" },
--         },
--       },
--     },
--     format = 'lsp_symbol',
--     confirm = function(picker, item)
--       picker:close()
--       Snacks.picker.pick("files", {
--         dirs = { item.file },
--       })
--     end,
--     filter = {
--       tex = true,
--     }
--   })
-- end
-- , { desc = "Find LaTeX environments using LSP" }) -- Updated description
