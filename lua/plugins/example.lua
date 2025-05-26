-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
local excluded_list = {
  "*.pdf", "*.aux", "*.bbl", "*.bcf", "*.blg", "*.fdb_latexmk", "*.fls", "*.log", "*.pdf", "*.run%.xml",
  "*.synctex%.gz", "*.out", "*.toc", "*.pyc", "*.pyo", "*.xml", "*.gz", "*.DS_Store", "*.zip",
  "__pycache__",
  "venv",
  ".git",
}
return {
  {
    'tomasr/molokai', -- colorscheme
    config = function()
      vim.cmd.colorscheme("molokai")
    end,
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    init = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_skim_sync = 1
      vim.g.vimtex_view_skim_activate = 1
      vim.g.vimtex_toc_custom_matchers = {
        { title = "Theorem",    re = [[\v^\s*\\begin\{theorem\}]] },
        { title = "Lemma",      re = [[\v^\s*\\begin\{lemma\}]] },
        { title = "Corollary",  re = [[\v^\s*\\begin\{corollary\}]] },
        { title = "Definition", re = [[\v^\s*\\begin\{definition\}]] },
      }
    end
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        sh = { "shellcheck" },
        tex = { "chktex" },
      },
    },
    config = function()
      local lint = require("lint")
      lint.linters.ruff.args = { "--ignore=E401", }
    end
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
        sh = { "shfmt" },
        lua = { "/opt/homebrew/bin/lua" },
        tex = { "latexindent" },
      },
    }
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
        },
      },
    }
  },
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
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                          -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
            ignored = true,
            exclude = excluded_list,
          },
          explorer = {
            exclude = excluded_list,
          }
        },
      },
    }
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    requires = {
      { "kdheepak/cmp-latex-symbols" },
    },
    sources = {
      {
        name = "latex_symbols",
        option = {
          strategy = 0, -- mixed
        },
      },
    },
  },
  {
    "latex-lsp/texlab",
  }
}
-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
