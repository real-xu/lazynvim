-- https://github.com/viniolvs/my-lazyvim/blob/c627b05106116265eef02d291ddcd48a4a975ada/lua/plugins/my-plugins.lua#L354

return {
  -- Colorscheme
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    config = function()
      require("dracula").setup({
        transparent_bg = true,
        italic_comment = true,
      })
    end,
  },

  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        show_end_of_buffer = false,
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.20,
        },
        integrations = {
          notify = true,
          mini = true,
          harpoon = true,
          leap = true,
          noice = true,
          cmp = true,
          ts_rainbow = true,
        },
      })
    end,
  },

  -- mini.files
  {
    "echasnovski/mini.files",
    version = false,
    lazy = false,
    config = function()
      require("mini.files").setup()
    end,
  },

  -- Notify
  {
    "rcarriga/nvim-notify",
    opts = { render = "compact", timeout = "750" },
  },

  -- tmux navigator
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    config = function()
      require("harpoon").setup({})
    end,
  },

  -- Modicator
  {
    "mawkler/modicator.nvim",
    dependencies = "Mofiqul/dracula.nvim", -- Add your colorscheme plugin here,
    lazy = false,
    config = function()
      local modicator = require("modicator")
      local colors = require("catppuccin.palettes").get_palette("macchiato")
      modicator.setup({
        highlights = {
          defaults = {
            bold = true,
          },
          modes = {
            ["n"] = {
              foreground = colors.blue,
            },
            ["i"] = {
              foreground = colors.green,
            },
            ["v"] = {
              foreground = colors.mauve,
            },
            ["V"] = {
              foreground = colors.mauve,
            },
            ["�"] = { -- This symbol is the ^V character
              foreground = colors.mauve,
            },
            ["s"] = {
              foreground = colors.orange,
            },
            ["S"] = {
              foreground = colors.orange,
            },
            ["R"] = {
              foreground = colors.red,
            },
            ["c"] = {
              foreground = colors.orange,
            },
          },
        },
      })
    end,
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = { extensions = { "toggleterm" } },
  },

  -- Notify
  {
    "rcarriga/nvim-notify",
    opts = { background_colour = "#000000", lazy = false },
  },

  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
      })
      opts.window = {
        completion = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:Operator,CursorLine:BufferLineInfoSelected,Search:None",
        }),
      }
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        {
          name = "buffer",
          option = {
            -- cmp from visible buffers
            get_bufnrs = function()
              local bufs = {}
              for _, win in ipairs(vim.api.nvim_list_wins()) do
                bufs[vim.api.nvim_win_get_buf(win)] = true
              end
              return vim.tbl_keys(bufs)
            end,
            -- cmp for all kind of words
            keyword_pattern = [[\k\+]],
            -- suggests from buffer after 4 letters typed
            keyword_length = 4,
          },
        },
      })
    end,
  },
  -- Codeium
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-a>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
    end,
  },

  -- Copilot
  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  -- },

  -- Multiple cursors
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "BufEnter",
  },

  -- Rainbow parentheses
  {
    "mrjones2014/nvim-ts-rainbow",
    event = "BufReadPre",
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
        },
      })
    end,
  },

  -- Java config
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.black,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
          nls.builtins.formatting.prettierd,
        },
      }
    end,
  },

  -- Zen Mode
  {
    "folke/zen-mode.nvim",
    event = "VimEnter",
    config = function()
      require("zen-mode").setup({})
    end,
  },

  -- Screen saver
  -- {
  --   "folke/drop.nvim",
  --   event = "VimEnter",
  --   lazy = false,
  --   config = function()
  --     require("drop").setup({ theme = "snow" })
  --   end,
  -- },

  --Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
  },

  -- Markdown mappings
  {
    "antonk52/markdowny.nvim",
    ft = { "markdown" },
    config = function()
      require("markdowny").setup({ filetypes = { "markdown" } })
    end,
  },

  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    ft = {
      "css",
      "html",
      "javascript",
      "javascriptreact",
      "lua",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("colorizer").setup({
        "*",
      }, {
        mode = "background",
      })
    end,
  },

  -- plugin to open links
  {
    "chrishrb/gx.nvim",
    event = { "BufEnter" },
    -- you can specify also another config if you want
    config = function()
      require("gx").setup({
        handlers = {
          plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
          github = true, -- open github issues
        },
      })
    end,
  },

  -- navbuddy
  {
    "SmiteshP/nvim-navbuddy",
    ft = {
      "c",
      "cpp",
      "java",
      "python",
      "typescript",
      "typescriptreact",
      "javascript",
    },
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      local navbuddy = require("nvim-navbuddy")
      navbuddy.setup({
        lsp = {
          auto_attach = true,
        },
      })
    end,
  },

  -- markdown notes for projects
  {
    "JellyApple102/flote.nvim",
    event = "BufReadPre",
    config = function()
      require("flote").setup()
    end,
  },

  -- idk
  {
    "giusgad/pets.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim", "edluffy/hologram.nvim" },
    config = function()
      require("pets").setup({})
    end,
  },
  --
  {
    "meatballs/notebook.nvim",
    lazy = false,
    config = function()
      require("notebook").setup({})
    end,
  },
}
