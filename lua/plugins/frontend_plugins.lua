return {
  {
    "luckasRanarison/tailwind-tools.nvim",
    lazy = false,
    build = ":UpdateRemotePlugins",
    config = function()
      require("tailwind-tools").setup {
        autocompletion = true,
      }
    end,
  },
  {
    "vuejs/vetur",
    opts = {
      ensure_installed = {
        "vls",
      },
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
    config = function()
      require('ts_context_commentstring').setup()
    end,
  },
}
