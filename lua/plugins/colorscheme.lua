-- In ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  -- Add Dracula colorscheme
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- First load the colorscheme
      vim.cmd([[colorscheme dracula]])

      -- Then override the problematic highlight groups
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#BD93F9" }) -- Purple for directories
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#BD93F9" })
      vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = "#F8F8F2" }) -- Lighter text

      -- For NvimTree (if you're using that instead)
      vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#BD93F9" })
      vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#BD93F9" })
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = "#F8F8F2" })
    end,
  },

  -- Configure LazyVim to use Dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
