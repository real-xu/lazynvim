local plugins = {}

-- 共通
table.insert(plugins, require("plugins.surround"))

-- Neovim用のプラグイン
if not vim.g.vscode then
  table.insert(plugins, require("plugins.hop"))
  table.insert(plugins, require("plugins.markdown-preview"))
end

return plugins
