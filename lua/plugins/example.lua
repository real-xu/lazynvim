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
      kind_filter = { tex = true },
    },
  },
  {
    "tomasr/molokai", -- colorscheme
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
      -- Ensuring custom matchers are used
      vim.g.vimtex_toc_custom_matchers = {
        { title = "Theorem",    re = [[\v^\s*\\begin\{theorem\}]] },
        { title = "Lemma",      re = [[\v^\s*\\begin\{lemma\}]] },
        { title = "Corollary",  re = [[\v^\s*\\begin\{corollary\}]] },
        { title = "Definition", re = [[\v^\s*\\begin\{definition\}]] },
      }
      vim.g.vimtex_toc_matchers = vim.g.vimtex_toc_custom_matchers
    end,
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
      lint.linters.ruff.args = { "--ignore=E401" }
    end,
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
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
      },
    },
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
          },
        },
      },
    },
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
          require("dapui").toggle({})
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
      local dap = require("dap")
      local dapui = require("dapui")
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
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- add any opts here
      hints = { enabled = false },
      -- for example
      provider = "openai",
      providers = {
        openai = {
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
          extra_request_body = {
            temperature = 0.75,
            max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
            --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
          },
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick",         -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua",              -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",        -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "flin16/vim-overleaf",
  },
  {
    "Saghen/blink.cmp",
    opts = {
      enabled = function()
        -- Enable when there is no file ~/.config/nvim-options/blink-disabled
        local path = vim.fn.stdpath("config") .. "/blink-disabled"
        return not vim.loop.fs_stat(path)
      end,
    },
  },
  {
    "giuxtaposition/blink-cmp-copilot",
  },
}
-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
