-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  -- Optional plugin
  -- require()
  require("config.vscode")
  -- vim.cmd([[source $HOME/.config/nvim/vscode/settings.vim]])
else
  require("config.lazy")
end

