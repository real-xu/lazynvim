return {
  {
    "danymat/neogen",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip", -- Explicitly add LuaSnip as a dependency
    },
    cmd = "Neogen",
    opts = {
      enabled = true,
      snippet_engine = "luasnip",
      languages = {
        cpp = { template = { annotation_convention = "doxygen" } },
        c = { template = { annotation_convention = "doxygen" } },
        java = { template = { annotation_convention = "doxygen" } },
        python = { template = { annotation_convention = "google_docstrings" } },
        go = { template = { annotation_convention = "godoc" } },
        typescript = { template = { annotation_convention = "jsdoc" } },
        javascript = { template = { annotation_convention = "jsdoc" } }, -- Added JavaScript as well since it uses the same convention
      },
    },
    keys = {
      -- Create a keybinding to trigger Neogen
      {
        "<Leader>nd",
        function()
          require("neogen").generate()
        end,
        desc = "Generate Documentation",
      },
      -- Optional: Map specific types of documentation
      {
        "<Leader>nf",
        function()
          require("neogen").generate({ type = "func" })
        end,
        desc = "Document Function",
      },
      {
        "<Leader>nc",
        function()
          require("neogen").generate({ type = "class" })
        end,
        desc = "Document Class",
      },
    },
  },
}
