return {
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "v1.*",
    config = function()
      require("window-picker").setup({
        -- Set your configuration options here
        autoselect_one = true,
        include_current = false,
        filter_rules = {
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify", "lazy" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
        -- Other options: 'label', 'both'
        selection_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        show_prompt = true,
        prompt_message = "Pick window: ",
      })

      -- Key mappings to select windows
      vim.keymap.set("n", "<leader>wp", function()
        local picked_window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(picked_window_id)
      end, { desc = "Pick window" })

      -- Optional: Add a mapping to swap windows
      vim.keymap.set("n", "<leader>ws", function()
        local picked_window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
        local current_window_id = vim.api.nvim_get_current_win()
        local current_buffer = vim.api.nvim_get_current_buf()
        local picked_buffer = vim.api.nvim_win_get_buf(picked_window_id)

        vim.api.nvim_win_set_buf(current_window_id, picked_buffer)
        vim.api.nvim_win_set_buf(picked_window_id, current_buffer)
      end, { desc = "Swap windows" })
    end,
  },
}
