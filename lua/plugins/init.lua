return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

   {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "markdown",
        "rust",
        "python",
        "vue",
      },
      highlight = { enable = true },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
    enabled = false,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ts_ls",
        -- other servers…
      },
    },
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
    "lervag/vimtex",
    ft = { "tex" },
    init = function()
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_view_method = 'sioyek'
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_mappings_enabled = 1
      vim.g.vimtex_indent_enabled = 0

      -- vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_context_pdf_viewer = "sioyek"


    end,
  },

  -- for debuging
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup {
        icons = { expanded = "▾", collapsed = "▸" },
        mappings = {
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
        },
        layouts = {
          {
            elements = { "scopes", "breakpoints", "stacks", "watches" },
            size = 40,
            position = "left",
          },
          {
            elements = { "repl", "console" },
            size = 0.25,
            position = "bottom",
          },
        },
        controls = {
          enabled = true,
          element = "repl",
          icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "↻",
            terminate = "□",
          },
        },
        floating = {
          border = "rounded",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
      }
    end,
  },
}

