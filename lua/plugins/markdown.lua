local M = {
  {
    "epwalsh/obsidian.nvim",
    ui = { enable = false },
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre Documents/Main-Notes/*.md",
    --   "BufNewFile Documents/Main-Notes/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Documents/Main-Notes/",
        },
        -- {
        --   name = "work",
        --   path = "~/vaults/work",
        -- },
      },

      -- see below for full list of options 👇
    },
  },

  {
    'brianhuster/live-preview.nvim',
    dependencies = {
      -- You can choose one of the following pickers
      'nvim-telescope/telescope.nvim',
      'ibhagwan/fzf-lua',
      'echasnovski/mini.pick',
    },
  },

  -- {
  --   "OXY2DEV/markview.nvim",
  --     lazy = false,
  --
  --     -- For `nvim-treesitter` users.
  --     priority = 49,
  --
  --     -- For blink.cmp's completion
  --     -- source
  --     dependencies = {
  --         "saghen/blink.cmp"
  --     },
  -- },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  {
    "snrogers/mermaider.nvim",
    -- lazy = false,
    dependencies = {
      "3rd/image.nvim", -- Required for image display
    },
    config = function()
      require("mermaider").setup({
        -- Your config here (see Configuration section below)

        -- Command to run the mermaid-cli
        -- {{IN_FILE}} will be replaced with the input file path
        -- {{OUT_FILE}} will be replaced with the output file path
        mermaider_cmd = 'npx -y -p @mermaid-js/mermaid-cli mmdc -i {{IN_FILE}} -o {{OUT_FILE}}.png -s 3',

        -- Directory for temporary files
        temp_dir = vim.fn.expand('$HOME/.cache/mermaider'),

        -- Auto render settings
        auto_render = true,          -- Auto render on save
        auto_render_on_open = true,  -- Auto render when opening a file
        auto_preview = true,         -- Automatically preview after rendering

        -- Mermaid diagram styling
        theme            = "forest",    -- "dark", "light", "forest", "neutral"
        background_color = "#1e1e2e", -- Background color for diagrams

        -- Additional mmdc options
        mmdc_options = "",

        -- Window size settings
        max_width_window_percentage = 80,    -- Maximum width as percentage of window
        max_height_window_percentage = 80,   -- Maximum height as percentage of window

        -- Render settings
        inline_render = true,            -- Use inline rendering instead of split window

        -- Split window settings (used when inline_render is false)
        use_split = true,                -- Use a split window to show diagram
        split_direction = "vertical",    -- "vertical" or "horizontal"
        split_width = 50,                -- Width of the split (if vertical)
        })
    end,
    ft = { "mmd", "mermaid" },
  }
}

return M
