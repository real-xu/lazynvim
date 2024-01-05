-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Check if we need to reload the file when it changed
-- vim.cmd("set laststatus=0")
-- vim.api.nvim_create_autocmd("statusline", {
--   command = "set laststatus=0",
-- })
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "LazyDone",
--   once = true,
--   callback = function()
--     vim.api.nvim_exec_autocmds(":set laststatus = 0", { pattern = "*" })
--     -- vim.notify("Update/Sync/Something is complete!")
--   end,
-- })
-- vim.cmd('hi "IlluminatedWordText guibg=#504945 gui=bold"')

-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--   command = "hi IlluminatedWordText guibg=#504945 gui=bold",
-- })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  command = "set foldmethod=manual",
})
