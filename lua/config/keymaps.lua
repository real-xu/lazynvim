-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<D-s>", ":w<CR>", { desc = "Save file", silent = true })
vim.keymap.set("i", "<D-s>", "<Esc>:w<CR>a", { desc = "Save file", silent = true })
vim.g.neovide_input_macos_option_key_is_meta = "only_left"

vim.api.nvim_echo({ { "Terminal toggle binding loaded!", "Normal" } }, true, {})
-- Terminal keybindings with Ctrl+`
vim.keymap.set({ "n", "t" }, "<C-`>", function()
  local term_bufnrs = {}
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[bufnr].buftype == "terminal" then
      table.insert(term_bufnrs, bufnr)
    end
  end

  if #term_bufnrs == 0 then
    -- No terminal exists, create a new one
    vim.cmd("split | terminal")
    vim.cmd("resize 15")
    vim.cmd("startinsert")
  else
    -- Check if a terminal is visible
    local term_visible = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].buftype == "terminal" then
        term_visible = true
        if vim.api.nvim_get_current_win() == win then
          -- Currently focused on terminal, hide it
          vim.cmd("hide")
        else
          -- Terminal visible but not focused, focus it
          vim.api.nvim_set_current_win(win)
          vim.cmd("startinsert")
        end
        break
      end
    end

    if not term_visible then
      -- Terminal exists but not visible, show it
      vim.cmd("sbuffer " .. term_bufnrs[1])
      vim.cmd("resize 15")
      vim.cmd("startinsert")
    end
  end
end, { desc = "Toggle terminal" })

-- Neovide enable Command key
if vim.g.neovide then
  -- Enable Command key mappings
  vim.g.neovide_input_use_logo = true -- Enable the Command/Super/Windows key
end
