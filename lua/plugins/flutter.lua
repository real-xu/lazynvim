return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for better UI
    },
    config = function()
      require("flutter-tools").setup({
        dev_log = {
          open_cmd = "botright 8split",
        },
      })
    end,
  },
}
