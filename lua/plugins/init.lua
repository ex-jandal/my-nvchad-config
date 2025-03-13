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

  -- {
  --   "pteroctopus/faster.nvim",
  --   lazy = false,
  --   config = function()
  --     require("faster").setup()
  --   end,
  -- },
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

  -- {
  --   vim.g.tex_flavor = 'latex'
  --   vim.g.vimtex_synctex = 1
  --   vim.g.tex_conceal = 'abdmg'
  --   vim.g.vimtex_compile_latexmk = {
  --   executable = "latexmk",
  --   OPTIONS = {
  --     "-xelatex",
  --     "-fine-line-error",
  --     "-synctex=1",
  --     "-interactions=nonstopmode",
  --     },
  --   },
  -- },

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

  -- {
  -- "lervag/vimtex",
  -- ft = { "tex" },
  -- config = function()
  --   vim.g.vimtex_view_method = 'sioyek'
  --   vim.g.vimtex_context_pdf_viewer = "sioyek"
  --   vim.g.vimtex_mappings_enabled = 1
  --   vim.g.vimtex_quickfix_mode = 1
  --   vim.g.vimtex_compiler_latexmk = {
  --       executable = 'lateamk',
  --       options = {
  --         '-xelatex',
  --       },
  --     }
  --
  --   -- vim.g.vimtex_compiler_latexmk = {
  --   --   executable = 'latexmk',
  --   --   options = {
  --   --     '-xelatex',
  --   --     '-interaction=nonstopmode',
  --   --     '-synctex=1',
  --   --   },
  --   -- }
  --
  --   vim.api.nvim_create_autocmd("User", {
  --     pattern = "VimtexEventCompileStarted",
  --     callback = function()
  --       local tex_dir = vim.fn.expand("%:p:h")
  --       local cmd = string.format("rm -f %s/*.aux %s/*.log %s/*.out %s/*.toc %s/*.synctex.gz %s/*.fdb_latexmk %s/*.fls",
  --         tex_dir, tex_dir, tex_dir, tex_dir, tex_dir, tex_dir, tex_dir)
  --       vim.fn.system(cmd)
  --     end,
  --   })
  -- end,
  -- }

  -- {
  --   "lervag/vimtex",
  --   ft = { "tex" },
  --   init = function()
  --       vim.g.tex_flavor = "latex"
  --       vim.g.vimtex_quickfix_mode = 0
  --       vim.g.vimtex_mappings_enabled = 1
  --       vim.g.vimtex_indent_enabled = 0
  --       vim.g.vimtex_view_method = "zathura"
  --       vim.g.vimtex_context_pdf_viewer = "zathura"
  --       vim.g.vimtex_compiler_method = "latexmk"
  --       vim.g.vimtex_compiler_latexmk = {
  --           options = {
  --               "-synctex=1",
  --               "-xelatex",
  --               "-gg",
  --           },
  --
  --       }
  --   vim.api.nvim_create_autocmd("User", {
  --     pattern = "VimtexEventCompileStarted",
  --     callback = function()
  --       local tex_dir = vim.fn.expand("%:p:h")
  --       local cmd = string.format("rm -f %s/*.aux %s/*.log %s/*.out %s/*.toc %s/*.synctex.gz %s/*.fdb_latexmk %s/*.fls",
  --         tex_dir, tex_dir, tex_dir, tex_dir, tex_dir, tex_dir, tex_dir)
  --       vim.fn.system(cmd)
  --     end,
  --   })
  --   end
  -- },

  -- {
  --   "lervag/vimtex",
  --   config = function()
  --     vim.g.vimtex_compiler_latexmk = {
  --       build_dir = '',
  --       callback = 1,
  --       continuous = 1,
  --       executable = 'lateamk',
  --       options = {
  --         '-xelatex',
  --         '-interaction=nonstopmode',
  --         '-synctex=1'
  --       },
  --     }
  --   end
  -- }
}
