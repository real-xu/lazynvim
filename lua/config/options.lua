-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Set default split behavior
vim.opt.splitright = true -- Vertical splits go to the right
vim.opt.splitbelow = true -- Horizontal splits go below

-- Set absolute line numbers instead of relative
vim.opt.number = true
vim.opt.relativenumber = false

-- Prevent automatic comment continuation
-- This needs to be in an autocmd to override filetype settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
  desc = "Disable automatic comment continuation",
})
