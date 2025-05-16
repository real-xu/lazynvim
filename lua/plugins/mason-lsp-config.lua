return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
        },
        -- Add required fields
        PATH = "prepend", -- Adjust how Mason modifies the system path
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
        registries = {
          "github:mason-org/mason-registry",
        },
        providers = {
          "mason.providers.client",
        },
        github = {
          download_url_template = "https://github.com/%s/releases/download/%s/%s",
        },
        pip = {
          upgrade_pip = false,
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", -- Lua
          "pyright", -- Python
          "tsserver", -- TypeScript/JavaScript
          "clangd", -- C/C++
          "rust_analyzer", -- Rust
          "gopls", -- Go
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")

      -- Language Server Configurations
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }, -- Avoid undefined 'vim' warnings
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
            },
          },
        },
        pyright = {},
        tsserver = {},
        clangd = {},
        rust_analyzer = {},
        gopls = {},
      }

      for server, config in pairs(servers) do
        lspconfig[server].setup(config)
      end

      -- LSP Keybindings
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = { buffer = event.buf, noremap = true, silent = true }

          -- Keymaps
          vim.keymap.set(
            "n",
            "gd",
            "<cmd>lua vim.lsp.buf.definition()<CR>",
            opts
          )
          vim.keymap.set(
            "n",
            "gr",
            "<cmd>lua vim.lsp.buf.references()<CR>",
            opts
          )
          vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
          vim.keymap.set(
            "n",
            "<leader>rn",
            "<cmd>lua vim.lsp.buf.rename()<CR>",
            opts
          )
          vim.keymap.set(
            "n",
            "<leader>ca",
            "<cmd>lua vim.lsp.buf.code_action()<CR>",
            opts
          )
          vim.keymap.set(
            "n",
            "<leader>f",
            "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
            opts
          )
        end,
      })
    end,
  },
}
