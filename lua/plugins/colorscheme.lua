return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- { "nyoom-engineering/oxocarbon.nvim" },
  -- { "rebelot/kanagawa.nvim" },
  -- { "sainnhe/sonokai" },
  -- { "tanvirtin/monokai.nvim" },
  -- Configure LazyVim to load gruvbox
  -- { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "savq/melange-nvim" },
  -- {"cpea2506/one_monokai.nvim"},
  { "Mofiqul/vscode.nvim" },

  -- { "AstroNvim/astrotheme" },
  -- { "oxfist/night-owl.nvim" },
  -- { "Tsuzat/NeoSolarized.nvim" },
  -- { "neanias/everforest-nvim" },
  -- { "ray-x/starry.nvim" },
  -- { "kepano/flexoki-neovim" },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "flexoki-light",
      -- colorscheme = "astrolight",
      colorscheme = "melange",
      -- colorscheme = "night-owl",
      transparent = true,
    },
  },
}
