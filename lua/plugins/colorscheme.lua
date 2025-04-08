return {
  -- Add Dracula colorscheme
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Configure LazyVim to use Dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
