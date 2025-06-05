-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keyset = vim.keymap.set
local function map_nv(lhs, rhs, opts)
  local modes = { "n", "v" }
  for _, mode in ipairs(modes) do
    keyset(mode, lhs, rhs, opts)
  end
end
local function map_all_mode(lhs, rhs, opts)
  map_nv(lhs, rhs, opts)
  keyset("i", lhs, rhs, opts)
  keyset("t", lhs, rhs, opts)
end
-- TODO: make this work
-- keyset("v", "<BS>", function()
--   vim.print("Pressed"); vim.cmd('d _<CR>')
-- end, { noremap = true, desc = "Backspace in normal mode" })
keyset("v", "x", '"_x', { noremap = true, desc = "Delete selection with Backspace" })
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
keyset("n", "<leader>dv", function()
  vim.cmd("DapVirtualTextToggle")
end, { desc = "Toggle virtual text of dap" })
keyset("n", "\\b", function()
  require("dap").toggle_breakpoint()
end, { desc = "Dap: Toggle Breakpoint" })
keyset("n", "\\dr", function()
  require("dap").repl.open()
end, { desc = "Dap: Open REPL" })
keyset({ "n", "v" }, "\\dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "Print variable (Hover Mode)" })
keyset({ "n", "v" }, "\\dp", function()
  require("dap.ui.widgets").preview()
end, { desc = "Print variable (Preview Mode)" })

-- Configure Coc.nvim keymaps
keyset("n", "<leader>rn", "<Plug>(coc-rename)", { desc = "Coc: Rename" })

keyset("v", "\\r", "<Plug>(coc-codeaction-refactor-selected)", { desc = "Coc: Refactor Selected" })
keyset("n", "\\cl", "<Plug>(coc-codelens-action)", { desc = "Coc: CodeLens Action" })
-- Resolve Coc conflicting keymaps
keyset("i", "<C-e>", "<End>", { desc = "Goto end" })

-- Now configure shortcuts for MacOS
-- if vim.g.neovide then
map_all_mode("<D-s>", "<Cmd>w<CR>") -- Save
map_all_mode("<D-w>", function()
  local success, _ = pcall(function()
    vim.cmd("tabclose")
  end)
  if not success then
    vim.notify("Cannot close the last tab page", vim.log.levels.WARN)
  end
end, { desc = "Close current tab" })
map_all_mode("<D-z>", function()
  vim.cmd("undo")
end)
keyset("i", "<D-v>", '<C-O>"+P')
keyset("c", "<D-v>", "<C-R>+")
keyset("n", "<D-v>", '"+p', { desc = "Paste from clipboard" })
keyset("v", "<D-v>", '"_d"+gP', { desc = "Remove the selected part and paste from system clipboard." })
keyset("v", "<D-c>", '"+y', { desc = "Copy to clipboard in visual mode" })
keyset("v", "<D-x>", '"+d', { desc = "Cut to clipboard" })
map_nv("<D-a>", "gg<S-v>G", { desc = "Select all" })
-- end
-- Set the keymap <leader>fg to trigger the picker
-- keyset("n", "<leader>fg", function()
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
