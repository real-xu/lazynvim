return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "svelte", --- make sure you have svelte LSP, the rest is your treesitter plugins
      }
    }
  }
};
