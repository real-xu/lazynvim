return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local actions = require("telescope.actions")
    opts.defaults = {
      mappings = {
        i = {
          ["<c-t>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<c-l>"] = actions.send_to_loclist + actions.open_loclist,
        },
      },
    }
  end,
}
