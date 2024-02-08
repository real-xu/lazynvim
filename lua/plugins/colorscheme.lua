-- if true then
--   return {}
-- end

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
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
