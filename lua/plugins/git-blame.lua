return {
  "f-person/git-blame.nvim",
  keys = {
    { "<leader>gb", "<cmd>GitBlameToggle<cr>", "Git Blame Toggle" },
  },
  opts = function()
    require("gitblame").setup({
      enabled = false,
    })
  end,
}
