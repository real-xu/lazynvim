return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- { "nyoom-engineering/oxocarbon.nvim" },
  -- { "rebelot/kanagawa.nvim" },
  -- { "sainnhe/sonokai" },
  -- { "tanvirtin/monokai.nvim" },
  -- Configure LazyVim to load gruvbox

  { "savq/melange-nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
      -- colorscheme = "monokai",
      -- colorscheme = "melange",
      -- transparent = true,
    },
  },
}
