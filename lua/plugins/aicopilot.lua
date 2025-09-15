return {
  {
    "giuxtaposition/blink-cmp-copilot",
    lazy = false,
  },

  {
    "zbirenbaum/copilot-cmp",
    lazy = false,
    config = function ()
      require("copilot_cmp").setup({})
    end
  },

  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
}
