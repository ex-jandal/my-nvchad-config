require("nvchad.configs.lspconfig").defaults()

local servers = { "marksman", "html", "cssls", "ts_ls", "tailwindcss-language-server", "svelte", "pyright", "texlab", "taplo", "clangd", "intelephense", "nil_ls", "dcm", "sqls", "bashls", "fish-lsp" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

local lspconfig = require "lspconfig"
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

lspconfig.jdtls.setup({
  root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
})


-- vim.lsp.config.bashls = {
--   cmd = { '~/.local/share/nvim/mason/bin/bash-language-server', 'start' },
--   filetypes = { 'bash', 'sh', "zsh" }
-- }
-- vim.lsp.enable 'bashls'
