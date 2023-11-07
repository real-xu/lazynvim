return {
  "neanias/everforest-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = "light" -- or 'light'

    vim.cmd.colorscheme("everforest")
  end,
}
