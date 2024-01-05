return {
  "maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = "light" -- or 'light'

    terminal_colors =
      true, -- add neovim terminal colors
      vim.cmd.colorscheme("solarized")
  end,
}
