return {
  "NeogitOrg/neogit",
  keys = {

    { "<leader>gn", "<cmd>Neogit<cr>", desc = "Launch neogit" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
  },
  config = true,
}
