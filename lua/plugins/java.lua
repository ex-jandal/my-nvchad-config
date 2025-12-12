return {
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    -- optional = true,
    opts = function()
      -- Simple configuration to attach to remote java debug process
      -- Taken directly from https://github.com/mfussenegger/nvim-dap/wiki/Java
      local dap = require("dap")
      dap.configurations.java = {
        {
          type = "java",
          request = "attach",
          name = "Debug (Attach) - Remote",
          hostName = "127.0.0.1",
          port = 5005,
        },
      }
    end,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "java-debug-adapter", "java-test" } },
      },
    },
  },

  {
    "nvim-java/nvim-java-dap",
    lazy = false,
  },
  {
    "nvim-java/nvim-java",
    lazy = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local bundles = {
        vim.fn.glob(vim.fn.stdpath('data')..'/mason/packages/java-test/extension/server/*.jar', true ),
        vim.fn.glob(vim.fn.stdpath('data')..'/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar', true ),
      }

      local function get_jdtls_cache_dir()
        return vim.fn.stdpath('cache') .. '/jdtls'
      end

      local function get_jdtls_workspace_dir()
        return get_jdtls_cache_dir() .. '/workspace'
      end

      local function get_jdtls_jvm_args()
        local env = os.getenv('JDTLS_JVM_ARGS')
        local args = {}
        for a in string.gmatch((env or ''), '%S+') do
          local arg = string.format('--jvm-arg=%s', a)
          table.insert(args, arg)
        end
        return unpack(args)
      end

      local workspace_dir = get_jdtls_workspace_dir()
      local data_dir = workspace_dir

      if vim.lsp.client.root_dir then
        data_dir = data_dir .. '/' ..vim.fn.fnamemodify(vim.lsp.client.root_dir, ':p:h:t')
      end

      require('java').setup()

      vim.lsp.config['jdtls'] = {
        cmd = {
          'jdtls',
          '-data',
          data_dir,
          get_jdtls_jvm_args(),
        },
        filetypes = { "java" },
        root_markers = { { "mvnw", "gradlew", "settings.gradle", "settings.gradle.kts", ".git" }, { "build.xml", "pom.xml", "build.gradle", "build.gradle.kts" } },
        settings = {
          java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
          },
        },

        init_options = {
          bundles = bundles,
        },
      }
      vim.lsp.enable('jdtls')
      -- require('jdtls').start_or_attach(config)

      -- local root_dir = vim.fs.dirname(vim.fs.find({
      --   "settings.gradle",
      --   "settings.gradle.kts",
      --   "pom.xml",
      --   "build.gradle",
      --   "mvnw",
      --   "gradlew",
      --   ".git",
      -- }, { upward = true })[1])
      -- local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
      -- require('java').setup({
      --   root_markers = root_dir,
      --   jdtls = {
      --     -- use the java language server provided by mason
      --     -- make sure you have installed it via :Mason
      --   cmd = {
      --     'java',
      --     '--enable-preview',
      --     '--add-modules=ALL-SYSTEM',
      --     '--enable-native-access=ALL-UNNAMED',
      --     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      --     '-Dosgi.bundles.defaultStartLevel=4',
      --     '-Declipse.product=org.eclipse.jdt.ls.core.product',
      --     '-Dlog.level=ALL',
      --     '-noverify',
      --     '-Xmx1G',
      --     '-jar', '/home/abu_jandal/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
      --     '-configuration', '/home/abu_jandal/.local/share/nvim/mason/packages/jdtls/config_linux',
      --     '-data', '/home/abu_jandal/workspace'
      --   },
      --     -- see `:h nvim-java-jdtls-configuration` for all available options
      --     configuration = {},
      --     version = 'v1.43.0',
      --   },
      --   java_test = {
      --     -- use junit for testing
      --     -- you can also use other test runners here like 'testng'
      --     enable = false,
      --     runner = 'junit',
      --     version = '0.43.1',
      --   },
      --   java_debug_adapter = {
      --     enable = false,
      --     -- version = '0.58.1',
      --   },
      --   spring_boot_tools = {
      --     enable = false,
      --     -- version = '1.55.1',
      --   },
      --   jdk = {
      --     -- install jdk using mason.nvim
      --     auto_install = false,
      --     version = '17.0.2',
      --   },
      --   mason = {
      --     -- These mason registries will be prepended to the existing mason
      --     -- configuration
      --     registries = {
      --       'github:nvim-java/mason-registry',
      --     },
      --   },
      -- })

      -- local root_dir = vim.fs.dirname(vim.fs.find({
      --   "settings.gradle",
      --   "settings.gradle.kts",
      --   "pom.xml",
      --   "build.gradle",
      --   "mvnw",
      --   "gradlew",
      --   ".git",
      -- }, { upward = true })[1])
      --
      -- -- -- Workspace directory for jdtls
      -- local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
      -- local dap = require("dap")
      -- dap.configurations.java = {
      --   java_debug_adapter = { enable = true },
      --   java_test = { enable = true },
      -- }

    --   vim.lsp.config["jdtls"] = {
    --     cmd = {
    --       'java',
    --       '--enable-preview',
    --       '--add-modules=ALL-SYSTEM',
    --       '--enable-native-access=ALL-UNNAMED',
    --       '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    --       '-Dosgi.bundles.defaultStartLevel=4',
    --       '-Declipse.product=org.eclipse.jdt.ls.core.product',
    --       '-Dlog.level=ALL',
    --       '-noverify',
    --       '-Xmx1G',
    --       '-jar', '/home/abu_jandal/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
    --       '-configuration', '/home/abu_jandal/.local/share/nvim/mason/packages/jdtls/config_linux',
    --       '-data', '/home/abu_jandal/workspace'
    --     },
    --     root_dir = root_dir,
    --     -- is this configuration right or not?
    --     -- it is taken from chatgpt, so it should be right
    --     -- or at least it should work fine
    --     settings = {
    --       java = {
    --         imports = {
    --           gradle = {
    --             wrapper = {
    --               verification = {
    --                 enabled = false,
    --               },
    --             },
    --           },
    --         },
    --       },
    --     },
    --   }
    --   vim.lsp.enable("jdtls")
    end,
  }
}
