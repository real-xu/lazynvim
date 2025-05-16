-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- autocmds.lua
local function create_dev_output()
  local group = vim.api.nvim_create_augroup("DevOutput", { clear = true })

  -- Create the command
  vim.api.nvim_create_user_command("DevOutput", function()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_command("split")
    vim.api.nvim_win_set_buf(0, buf)
    vim.api.nvim_command("wincmd J")
    vim.api.nvim_buf_set_name(buf, "[Development Output]")
    vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
    vim.api.nvim_buf_set_option(buf, "swapfile", false)
    vim.api.nvim_buf_set_option(buf, "bufhidden", "hide")
    vim.api.nvim_buf_set_option(buf, "filetype", "DevOutput")
    vim.api.nvim_win_set_height(0, 10)
    return buf
  end, {})

  -- Make the dev_print function globally available
  _G.dev_print = function(msg)
    local bufnr = nil
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_get_name(buf):match("Development Output") then
        bufnr = buf
        break
      end
    end

    if not bufnr then
      bufnr = vim.api.nvim_exec2("DevOutput", { output = true }).output
    end

    local timestamp = os.date("%H:%M:%S")
    local formatted_msg = string.format("[%s] %s", timestamp, msg)
    vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, { formatted_msg })

    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == bufnr then
        vim.api.nvim_win_set_cursor(
          win,
          { vim.api.nvim_buf_line_count(bufnr), 0 }
        )
        break
      end
    end
  end

  -- Optional: Add any autocmds related to the output window
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "DevOutput",
    callback = function()
      -- Set any buffer-local options for DevOutput buffers
      vim.opt_local.wrap = true
      vim.opt_local.number = true
    end,
  })
end

-- Initialize the dev output setup
create_dev_output()

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})
