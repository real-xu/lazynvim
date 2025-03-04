return {
  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false, -- Load eagerly
    priority = 999, -- Ensure it loads after devicons
    config = function()
      require("barbecue").setup()
      require("nvim-navic").setup({})
    end,
  },
}
