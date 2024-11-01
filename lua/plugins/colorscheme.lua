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
        style = "warmer",
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
    "EdenEast/nightfox.nvim",
    name = "nightfox",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dayfox",
    },
  },
}
