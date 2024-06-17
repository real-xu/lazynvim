-- Add the key mappings only for Markdown files in a zk notebook.
return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "fzf",
      lsp = {
        config = {
          cmd = { "zk", "lsp" },
          name = "zk",
          -- on_attach = ...
          -- etc, see `:h vim.lsp.start_client()`
        },

        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
    })
  end,
}
