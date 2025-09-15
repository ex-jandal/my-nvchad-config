local cmp = require('cmp')
local function cmp_setup()
  cmp.setup {
    viwe = {
      entries = { name = 'custom', selection_order = 'near_cursor' },
    },
    window = {
      completion = {
        -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        col_offset = 999,
        side_padding = 0,
        border = "rounded",
      },
      documentation = {
        -- col_offset = 999, -- big negative pushes window to far left
        -- row_offset = 999,  -- pushes doc window below
        -- max_width = 60,
        -- max_height = 20,
        -- zindex = 90,
        border = "rounded",
      },
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
        local strings = vim.split(kind.kind, "%s", { trimempty = true })

        kind.kind = " " .. (strings[1] or "") .. " │"
        kind.menu = "  " .. (strings[2] or "")

        return kind
      end,
    },
    experimental = {
      ghost_text = true, -- <-- this shows ghost text inline
    },
    sources = {
      -- datasbase auto completion
      { name = "vim-dadbod-completion", group_index = 2 },
      -- Path Source
      { name = "path", group_index = 2 },
      -- Copilot Source
      { name = "copilot", group_index = 2 },
      -- Other Sources
      { name = "nvim_lsp", group_index = 2 },
      { name = "nvim_lua", group_index = 2 },
      { name = "luasnip", group_index = 2 },
      { name = "buffer", group_index = 2 },
      { name = "async_path", group_index = 2 },

      -- I don't use these, but they are available
      -- and can be enabled if desired later
      { name = "calc", group_index = 2 },
      { name = "emoji", group_index = 2 },
      { name = "crates", group_index = 2 },
      { name = "spell", group_index = 2 },
      { name = "dictionary", group_index = 2 },
      { name = "cmdline", group_index = 2 },
      { name = "git", group_index = 2 },
      { name = "orgmode", group_index = 2 },
      { name = "latex_symbols", group_index = 2 },
      { name = "pandoc_references", group_index = 2 },
      { name = "nvim_lsp_signature_help", group_index = 2 },
      { name = "look", group_index = 2 },
      { name = "fish", group_index = 2 },
      { name = "vimwiki", group_index = 2 },
      { name = "tags", group_index = 2 },
      { name = "treesitter", group_index = 2 },
    },
  }
end

cmp_setup()
