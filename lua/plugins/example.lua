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
    "LazyVim/LazyVim",
    opts = {
      kind_filter = { tex = true }
    }
  },
  {
    'tomasr/molokai', -- colorscheme
    config = function()
      vim.cmd.colorscheme("molokai")
    end,
  },
  {
    "folke/which-key.nvim",
    --TODO: Try to use this without warning
    -- opts = function(_, opts)
    --   -- 添加 '\' 开头的提示组
    --   opts.defaults["\\"] = {
    --     name = "\\",             -- 或你喜欢的名字，比如 '+custom'
    --     d = { name = "+debug" }, -- 这样会提示 \d 有 "debug" 的子命令
    --   }
    -- end,
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    init = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_skim_sync = 1
      vim.g.vimtex_view_skim_activate = 1
      vim.g.vimtex_compiler_latexmk = {
        out_dir = "build",    -- use a separate build directory
        callback = 1,         -- enable callback
        continuous = 1,       -- enable continuous compilation
        options = {
          "-pdf",             -- use pdf output
          "-shell-escape",    -- enable shell escape
          "-verbose",         -- verbose output
          "-file-line-error", -- file line error messages
        },
      }
      -- TODO: This seems not used
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
    "neoclide/coc.nvim",
    branch = "release",
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
            ignored = true,
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
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle {}
        end,
        desc = "Dap UI",
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        desc = "Eval",
        mode = { "n", "v" },
      },
    },
    opts = {},
    config = function(_, opts)
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dap.repl.open()
      end
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
      -- dapui.close {}
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function()
      -- dapui.close {}
      -- end
    end,
  },
  {
    "flin16/vim-overleaf",
  }
}
-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
