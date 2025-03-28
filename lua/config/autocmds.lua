-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 標準出力にログを出力する関数
-- local function log(message)
--   print(os.date("%Y-%m-%d %H:%M:%S") .. " - " .. message)
-- end

-- 実行環境を判定する関数
local function detect_environment()
  local env = {}

  -- Linux
  env.is_linux = vim.fn.has("unix") == 1 and not vim.fn.has("wsl") == 1

  -- Windows
  env.is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1

  -- WSL
  env.is_wsl = vim.fn.has("wsl") == 1

  -- VSCode Neovim
  env.is_vscode = vim.g.vscode ~= nil

  return env
end

-- 実行環境を取得
local env = detect_environment()

-- モード変更時IME自動オフ
if env.is_linux then
  vim.api.nvim_set_keymap("i", "<silent> <Esc>", "<Esc>:call system('fcitx5-remote -c')<CR>", { noremap = true })
  -- log("IME auto-off setting complete for LINUX")
elseif env.is_vscode or env.is_wsl then
  vim.o.shell = "/usr/bin/bash --login"
  vim.cmd('autocmd InsertLeave * :call system("zenhan.exe 0")')
  vim.cmd('autocmd CmdlineLeave * :call system("zenhan.exe 0")')
  -- log("IME auto-off setting complete for VSCode or WSL")
elseif env.is_windows then
  vim.o.shell = "cmd.exe"
  vim.cmd("autocmd InsertLeave * :call system('zenhan 0')")
  vim.cmd("autocmd CmdlineLeave * :call system('zenhan 0')")
  -- log("IME auto-off setting complete for Windows")
end

-- markdownの赤い波線を非表示
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.spell = false
    vim.opt.conceallevel = 0
  end,
})
