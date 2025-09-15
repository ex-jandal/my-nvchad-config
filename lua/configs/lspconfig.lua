require("nvchad.configs.lspconfig").defaults()

local servers = { "marksman", "html", "cssls", "ts_ls", "tailwindcss-language-server", "svelte", "pyright", "texlab", "taplo", "clangd", "intelephense", "nil_ls", "dcm", "bashls", "shellcheck", "fish_lsp", "asm-lsp", "tailwindcss", "omnisharp", "dockerls", "docker_compose_language_service"}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

local lspconfig = require "lspconfig"

require('lspconfig').ts_ls.setup({})
lspconfig.vuels.setup{
  -- add filetypes for typescript, javascript and vue
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'svelte' },
  init_options = {
    vue = {
      -- disable hybrid mode
      hybridMode = false,
    },
    javascriptreact = {
      hybridMode = false,
    },
    typescriptreact = {
      hybridMode = false,
    },
  },
}
-- lspconfig.volar.setup {
--   -- add filetypes for typescript, javascript and vue
--   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'svelte' },
--   init_options = {
--     vue = {
--       -- disable hybrid mode
--       hybridMode = false,
--     },
--     javascriptreact = {
--       hybridMode = false,
--     },
--     typescriptreact = {
--       hybridMode = false,
--     },
--   },
-- }

-- lspconfig.ts_ls.setup {
--     -- Initial options for the TypeScript language server
--     init_options = {
--         plugins = {
--             {
--                 -- Name of the TypeScript plugin for Vue
--                 name = '@vue/typescript-plugin',
--
--                 -- Location of the Vue language server module (path defined in step 1)
--                 location = "~/.local/share/nvim/mason/bin/vls",
--
--                 -- Specify the languages the plugin applies to (in this case, Vue files)
--                 languages = { 'vue' },
--             },
--         },
--     },
--
--     -- Specify the file types that will trigger the TypeScript language server
--     filetypes = {
--         'typescript',          -- TypeScript files (.ts)
--         'javascript',          -- JavaScript files (.js)
--         'javascriptreact',     -- React files with JavaScript (.jsx)
--         'typescriptreact',     -- React files with TypeScript (.tsx)
--         'vue'                  -- Vue.js single-file components (.vue)
--     },
-- }

require('java').setup({
  root_markers = {
    'settings.gradle',
    'settings.gradle.kts',
    'pom.xml',
    'build.gradle',
    'mvnw',
    'gradlew',
    'build.gradle',
    'build.gradle.kts',
    '.git',
  },
  java_test = {
    -- use junit for testing
    -- you can also use other test runners here like 'testng'
    runner = 'junit',
    version = '0.43.1',
  },
  java_debug_adapter = {
    enable = true,
    -- version = '0.58.1',
  },
  spring_boot_tools = {
    enable = false,
    -- version = '1.55.1',
  },
  -- mason = {
  -- -- These mason registries will be prepended to the existing mason
  -- -- configuration
  -- registries = {
  --   'github:nvim-java/mason-registry',
  -- },

})

-- lspconfig.jdtls.setup({
--   root_dir = vim.fs.dirname(vim.fs.find({
--     'settings.gradle',
--     'settings.gradle.kts',
--     'pom.xml',
--     'build.gradle',
--     'mvnw',
--     'gradlew',
--     'build.gradle',
--     'build.gradle.kts',
--     '.git',
--   }, { upward = true })[1]),
-- })

local root_dir = vim.fs.dirname(vim.fs.find({
  "settings.gradle",
  "settings.gradle.kts",
  "pom.xml",
  "build.gradle",
  "mvnw",
  "gradlew",
  ".git",
}, { upward = true })[1])

-- Workspace directory for jdtls
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
  cmd = {
    "jdtls",  -- Make sure jdtls is in PATH (via Mason or system)
    "-data", workspace_dir,
  },
  root_dir = root_dir,
}

lspconfig.jdtls.setup(config)

-- lspconfig.sqls.setup({
--   cmd = { "sqls" },
--   -- on_attach = function(client, bufnr)
--   --   require('sqls').on_attach(client, bufnr) -- require sqls.nvim
--   -- end
--   --
--   settings = {
--     sqls = {
--       connections = {
--         {
--           driver = 'mysql',
--           dataSourceName = 'sultan:sultan@tcp(127.0.0.1:3306)/neo',
--         },
--         -- {
--         --   driver = 'postgresql',
--         --   dataSourceName = 'host=127.0.0.1 port=15432 user=postgres password=mysecretpassword1234 dbname=dvdrental sslmode=disable',
--         -- },
--       },
--     },
--   },
-- })

-- lspconfig.asm_lsp.setup{
--     cmd = { "asm-lsp" },
--     filetypes = { "asm", "s", "S" },
--     root_dir = lspconfig.util.root_pattern(".git", "."),
--     single_file_support = true,
-- }

-- require'lspconfig'.rust_analyzer.setup {
--   cmd = vim.lsp.rpc.connect("127.0.0.1", 27631),
--   -- When using unix domain sockets, use something like:
--   --cmd = vim.lsp.rpc.domain_socket_connect("/path/to/ra-multiplex.sock"),
--   init_options = {
--     lspMux = {
--       version = "1",
--       method = "connect",
--       server = "rust-analyzer",
--     },
--   },
-- }

-- vim.lsp.config.bashls = {
--   cmd = { '~/.local/share/nvim/mason/bin/bash-language-server', 'start' },
--   filetypes = { 'bash', 'sh', "zsh" }
-- }
-- vim.lsp.enable 'bashls'
