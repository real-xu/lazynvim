return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
      })
    end,
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    name = "onedark",
    config = function()
      require("onedark").setup({
        style = "light",
      })
    end,
  },
  {
    "morhetz/gruvbox",
    lazy = true,
    name = "gruvbox",
    config = function()
      vim.o.background = "dark"
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
