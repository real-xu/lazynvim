local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { 'norcalli/nvim-colorizer.lua' },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'nvim-treesitter/playground' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'nvim-treesitter/nvim-treesitter-refactor' },
    { 'nvim-treesitter/nvim-treesitter-context' },
    { 'nvim-treesitter/nvim-treesitter-highlight' },
    { 'nvim-treesitter/nvim-treesitter-indent' },
    { 'norcalli/nvim-colorizer.lua' },
    -- lua with lazy.nvim
    { 'folke/lua-dev.nvim' },
    { 'folke/trouble.nvim' },
    { 'folke/todo-comments.nvim' },
    { 'folke/which-key.nvim' },
    { 'folke/zen-mode.nvim' },
    { 'folke/twilight.nvim' },
    { 'folke/lsp-colors.nvim' },
    { 'folke/lsp-trouble'},
} 
  "danielfalk/smart-open.nvim",
  branch = "0.2.x",
  config = function()
    require("telescope").load_extension("smart_open")
  end,
  dependencies = {
    "kkharji/sqlite.lua",
    -- Only required if using match_algorithm fzf
    -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
    { "nvim-telescope/telescope-fzy-native.nvim" },
    { 'petertriho/nvim-scrollbar' },
  },
} 
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = true,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})


-- Format current document
-- vscode.action("editor.action.formatDocument");

-- do -- Find in files for word under cursor
--   vscode.action("workbench.action.findInFiles", {
--     args = { query = vim.fn.expand('<cword>') }
--   })
-- end

------------------
--- has_config ---
------------------

-- Check if the configuration "not.exist" exists

-- Should return: false

-- -- Check multiple configurations
-- vim.print("Multiple configurations? " + vscode.has_config({ "not.exist", "existing.config" }))

-- -- Get the value of "editor.tabSize"
-- print("Current tab size? " + vscode.get_config("editor.tabSize")) -- a number

-- -- Get multiple configurations

-- Should return: { "the font family", "the editor tabSizse" }

-- Should return: { false, true }
-- error: Call '_wait' timed out

-- require("lazy").setup({
--   spec = {
--     -- add LazyVim and import its plugins
--     { "LazyVim/LazyVim", import = "lazyvim.plugins" },
--     -- import any extras modules here
--     { import = "lazyvim.plugins.extras.lang.typescript" },
--     { import = "lazyvim.plugins.extras.lang.json" },
--     { import = "lazyvim.plugins.extras.ui.mini-animate" },
--     -- import/override with your plugins
--     { import = "plugins" },
--   },
--   defaults = {
--     -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
-- default.
--     lazy = false,
--     -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
--     -- have outdated releases, which may break your Neovim install.
--     -- version = false, -- always use the latest git commit
--     version = "*", -- try installing the latest stable version for plugins that support semver
--   },
--   install = { colorscheme = { "tokyonight", "habamax" } },
--   checker = { enabled = false }, -- automatically check for plugin updates
--   -- performance = {
--   --   rtp = {
--   --     -- disable some rtp plugins
--   --     disabled_plugins = {
--   --       "gzip",
--   --       -- "matchit",
--   --       -- "matchparen",
--   --       -- "netrwPlugin",
--   --       "tarPlugin",
--   --       "tohtml",
--   --       "tutor",
--   --       "zipPlugin",
--   --     },
--   --   },
--   -- },
-- })