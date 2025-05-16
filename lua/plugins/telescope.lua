function GET_SESSION_PATH()
  local session_manager = require("session_manager")
  local current_session = session_manager.session_filename
  if current_session then
    local session_path = session_manager.get_session_file(current_session)
    return session_path:absolute()
  else
    return nil
  end
end

return {
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        -- Load fzf extension
        telescope.load_extension("fzf")

        -- Configure telescope settings
        telescope.setup({
          defaults = {
            layout_strategy = "horizontal",
            sorting_strategy = "ascending",
            layout_config = { prompt_position = "top" },
            winblend = 0,
          },
        })
      end,
    },
  },
}
