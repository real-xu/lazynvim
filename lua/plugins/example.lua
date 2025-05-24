-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
return {
  'tomasr/molokai', -- colorscheme
  {"mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      sh = { "shellcheck" },
    },
  },
  config = function(_, opts)
      local lint = require("lint")
      lint.linters.ruff.args = { "--ignore=E401", }
  end
  },
  {"stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "black" },
      sh = { "shfmt" },
      lua = { "stylua" },
    },
  }},
  {"neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
      },
    },
  }},
  {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("dap-python").setup("python")
  end,
  },
  {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_no_tab_map = false
    vim.api.nvim_set_keymap("i", "<C-Tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    -- Use a different keybinding for accepting suggestions, for terminal mode.
    vim.api.nvim_set_keymap("i", "<C-M>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  end,
  },
  {
   "amitds1997/remote-nvim.nvim",
   dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
   },
   config = true,
  },
  {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
    { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  },
  build = "make tiktoken", -- Only on MacOS or Linux
  opts = {
    -- See Configuration section for options
  },
  -- See Commands section for default commands if you want to lazy load on them
  },
}
-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
