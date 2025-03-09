-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set default split behavior
vim.opt.splitright = true -- Vertical splits go to the right
vim.opt.splitbelow = true -- Horizontal splits go below

-- Prevent automatic comment continuation
vim.opt.formatoptions:remove({ "c", "r", "o" })

-- Set absolute line numbers instead of relative
vim.opt.number = true
vim.opt.relativenumber = false
