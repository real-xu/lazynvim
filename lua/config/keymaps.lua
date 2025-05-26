-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map_nv(lhs, rhs, opts)
  local modes = { "n", "v" }
  for _, mode in ipairs(modes) do
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
local function map_all_mode(lhs, rhs, opts)
  map_nv(lhs, rhs, opts)
  vim.keymap.set("i", lhs, rhs, opts)
  vim.keymap.set("t", lhs, rhs, opts)
end
-- TODO: make this work
vim.keymap.set("v", "x", '"_x', { noremap = true, desc = "Delete selection with Backspace" })
map_all_mode("<F5>", function()
  require("dap").continue()
end, { desc = "DAP: Continue" })
map_all_mode("<F6>", function()
  require("dap").run_last()
end, { desc = "DAP: Use last config" })
map_all_mode("<F10>", function()
  require("dap").step_over()
end, { desc = "DAP: Step Over" })
map_all_mode("<F11>", function()
  require("dap").step_into()
end, { desc = "DAP: Step Into" })
map_all_mode("<F12>", function()
  require("dap").step_out()
end, { desc = "DAP: Step Out" })
vim.keymap.set("n", "\\b", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })

-- Now configure shortcuts for MacOS
-- if vim.g.neovide then
vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
vim.keymap.set("i", "<D-s>", "<C-O>:w<CR>")
map_all_mode("<D-w>", function()
  local success, _ = pcall(function() vim.cmd('tabclose') end)
  if not success then
    vim.notify("Cannot close the last tab page", vim.log.levels.WARN)
  end
end, { desc = "Close current tab" })
map_all_mode("<D-z>", function() vim.cmd("undo") end)
vim.keymap.set("i", "<D-v>", '<C-O>"+p')
vim.keymap.set("c", "<D-v>", "<C-R>+")
vim.keymap.set("n", "<D-v>", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("v", "<D-v>", '"_d"+gP', { desc = "Remove the selected part and paste from system clipboard." })
vim.keymap.set("v", "<D-c>", '"+y', { desc = "Copy to clipboard in visual mode" })
vim.keymap.set("v", "<D-x>", '"+d', { desc = "Cut to clipboard" })
map_nv("<D-a>", "gg<S-v>G", { desc = "Select all" })
-- end
local function get_environments_from_lsp_symbols(symbols)
  local blocks = {}
  local lsp_symbol_kind = vim.lsp.protocol.SymbolKind -- Access the SymbolKind enum

  local function traverse(nodes)
    for _, symbol in ipairs(nodes) do
      -- We check for 'Struct' which texlab uses for most \begin{}...\end{} blocks.
      -- You could add other kinds here if your LSP server uses them.
      if symbol.kind == lsp_symbol_kind.Struct then
        table.insert(blocks, {
          -- lnum is 0-indexed from LSP, so we add 1 for vim
          lnum = symbol.range.start.line + 1,
          -- 'text' is the name of the environment (e.g., "figure", "itemize")
          text = "\\begin{" .. symbol.name .. "}",
        })
      end
      -- Recursively search in child symbols
      if symbol.children and #symbol.children > 0 then
        traverse(symbol.children)
      end
    end
  end

  traverse(symbols)
  return blocks
end

-- Set the keymap <leader>fg to trigger the picker
vim.keymap.set("n", "<leader>fg", function()
  local Snacks = require("snacks")
  return Snacks.picker({
    finder = "lsp_symbols", -- Use the LSP symbols as the source
    layout = {
      layout = {
        box = "horizontal",
        width = 0.5,
        height = 0.5,
        {
          box = "vertical",
          border = "rounded",
          title = "Find directory",
          { win = "input", height = 1,     border = "bottom" },
          { win = "list",  border = "none" },
        },
      },
    },
    format = 'lsp_symbol',
    confirm = function(picker, item)
      picker:close()
      Snacks.picker.pick("files", {
        dirs = { item.file },
      })
    end,
    filter = {
      tex = true,
    }
  })
end
, { desc = "Find LaTeX environments using LSP" }) -- Updated description
local function get_symbols()
  -- 1. 检查texlab是否已附加到当前缓冲区
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  local texlab_found = false
  local bufnr = vim.api.nvim_get_current_buf()
  for _, client in ipairs(clients) do
    if client.name == "texlab" then
      texlab_found = true
      client.request("textDocument/documentSymbol", {
        textDocument = vim.lsp.util.make_text_document_params(bufnr),
      }, function(err, result, ctx, config)
        if err then
          print("Error:", vim.inspect(err))
          return
        end
        print("texlab symbols:", vim.inspect(result))
      end, bufnr)
      break
    end
  end

  if not texlab_found then
    vim.notify("Texlab LSP 未附加到当前缓冲区。", vim.log.levels.WARN)
    return
  end

  vim.notify("正在向 texlab 请求文档结构...", vim.log.levels.INFO)
end
