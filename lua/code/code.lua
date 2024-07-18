-- source: https://www.lazyvim.org/extras/vscode
require("lazy").setup({
    spec = {
      { "LazyVim/LazyVim", import = "lazyvim.plugins" },
      { import = "lazyvim.plugins.extras.vscode" },
      { import = "plugins" },
    },
})