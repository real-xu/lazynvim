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
  -- { "Tsuzat/NeoSolarized.nvim" },
  -- { "neanias/everforest-nvim" },
  -- { "ray-x/starry.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
      -- colorscheme = "monokai",
      -- colorscheme = "melange",
      -- transparent = true,
    },
  },
}
