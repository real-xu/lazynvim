if vim.g.vscode then
  -- Optional plugin
  -- require()
  require("config.vscode")
  require("code.test")
  -- vim.cmd([[source $HOME/.config/nvim/vscode/settings.vim]])
else
  require("config.lazy")
end
