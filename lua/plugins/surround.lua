return {
  "kylechui/nvim-surround",
  cond = true,
  config = function()
    require("nvim-surround").setup({
      -- オプションは必要に応じてカスタマイズ
    })
  end,
}
