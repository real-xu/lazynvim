-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.cmd([[command! -nargs=* BashCommand lua RunBashCommand(<q-args>)]])

function RunBashCommand(command)
  local output = vim.fn.system(command)
  print(output)
end

vim.cmd(
  [[command! -nargs=* TSKill BashCommand kill -9 $(ps aux | grep tsserver | grep $(node --version | sed 's/v//') | awk '{print $2}' | xargs)]]
)
