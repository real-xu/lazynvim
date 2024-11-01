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
      vim.g.gruvbox_contrast_dark = "soft"
      vim.g.gruvbox_contrast_light = "soft"
      vim.o.background = "light"
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
