-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
    -- VSCode extension
    require("code.code")
    require("code.test")
else
    -- ordinary Neovim
    require("config.lazy")
end