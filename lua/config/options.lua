-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.fn.has("gui_running") == 1 then
  vim.o.clipboard = ""
end
vim.g.copilot_no_tab_map = true
vim.o.guifont = "Monaco:h16"
vim.cmd("set wrap")
