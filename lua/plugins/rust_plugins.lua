local M = {

  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require("lua.plugins.acmp").setup.buffer {
        sources = { { name = "crates" } },
      }
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    ft = "rust",
    config = function()
      local extension_path = vim.env.HOME .. '.local/share/nvim/mason/packages/codelldb/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb'
      local this_os = vim.uv.os_uname().sysname;

      -- The liblldb extension is .so for Linux and .dylib for MacOS
      liblldb_path = liblldb_path .. (this_os == "Linux" and ".so")

      local cfg = require('rustaceanvim.config')
      return {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end,
    ["rust-analyzer"] = {
      cmd = vim.lsp.rpc.connect("127.0.0.1", 27631), -- use ra-multiplex instead of rust-analyzer
      init_options ={
        lspMux = {
          version = "1",
          method = "connect",
          server = "rust-analyzer",
        },
      },
      cargo = {
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
        buildScripts = {
          enable = true,
        },
        allFeatures = true,
      },
      checkOnSave = {
        enable = false,
        command = "clippy",
      },
      procMacro = {
        enable = true,
        ignored = {
          leptos_macro = {
            "server",
          },
        },
      },
      checkOnType = {
        enable = true,
      },
      {
        diagnostics = {
          experimental = true,
        },
      },
    },
  },

  {
    "willothy/leptos.nvim",
    event = "VeryLazy"
  },
}

return M
