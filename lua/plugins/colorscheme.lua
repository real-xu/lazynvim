return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = function()
      return {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      }
    end,
  },
  -- { "tanvirtin/monokai.nvim" },
  -- Configure LazyVim to load gruvbox
  -- { "savq/melange-nvim" },
  -- -- { "Mofiqul/vscode.nvim" },
  -- { "catppuccin/nvim" },
  -- { "sainnhe/sonokai" },
  -- { "maxmx03/solarized.nvim" },
  -- {
  --
  --   "yorik1984/newpaper.nvim",
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  -- },
  { "rose-pine/neovim" },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "solarized",
      -- colorscheme = "tokyonight",
      -- colorscheme = "night-owl",
      transparent = true,
    },
  },
}
