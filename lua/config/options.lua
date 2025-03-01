-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.wrap = true
vim.g.perl_host_prog = "/usr/bin/perl"
vim.g.loaded_perl_provider = 0
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true -- Highlight current line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.wrap = true -- Don't wrap lines
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.termguicolors = true -- True color support
vim.opt.updatetime = 250 -- Faster completion
vim.opt.timeoutlen = 300 -- Faster key mapping
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.scrolloff = 8 -- Lines of context
vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.breakindent = true -- Wrapped lines preserve indent
vim.opt.undofile = true -- Persistent undo
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.splitbelow = true -- Split below
vim.opt.splitright = true -- Split right
vim.opt.laststatus = 3 -- Global statusline
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- SSH-specific optimizations
vim.opt.shadafile = "NONE" -- Don't write shada file (reducing network traffic)
vim.opt.backup = false -- Don't use backup files
vim.opt.writebackup = false -- Don't backup before overwriting
vim.opt.swapfile = false -- Don't use swap files
vim.opt.undofile = false -- Don't use persistent undo
vim.g.loaded_ruby_provider = 0 -- Disable ruby provider
vim.g.loaded_perl_provider = 0 -- Disable perl provider
vim.g.loaded_python3_provider = 0 -- Disable python3 provider
vim.g.loaded_node_provider = 0 -- Disable node provider
vim.opt.hidden = false
