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
    "altercation/vim-colors-solarized",
    lazy = true,
    name = "solarized",
    config = function()
      -- Set Vim global variables for Solarized
      vim.g.solarized_termcolors = 256
      vim.g.solarized_bold = true
      vim.g.solarized_underline = true
      vim.g.solarized_italic = true
      vim.g.solarized_visibility = "low" -- Options: 'normal', 'low', 'high'
      vim.g.solarized_diffmode = "low"

      -- Set background to light or dark
      vim.o.background = "light" -- or "dark"
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
