require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- moving the line up and down
map("n", "<A-C-k>", ":m .-2<CR>==", { noremap = true, silent = true })
map("n", "<A-C-j>", ":m .+1<CR>==", { noremap = true, silent = true })

map("v", "<A-C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
map("v", "<A-C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- LSP-related keymaps
map("n", "<Leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "code action" })
map("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "goto definition" })
map("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "goto declaration" })
map("n", "gi", vim.lsp.buf.implementation, { noremap = true, silent = true, desc = "goto implementation" })
map("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true, desc = "goto references" })
map("n", "<Leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "rename" })

-- open up the full error
map("n", "E", vim.diagnostic.open_float)


-- map("n", "<Leader>cc", ":VimtexCompile<CR>", { noremap = true, silent = true, desc = "Compile PDF" })
map("n", "<Leader>cv", ":VimtexView<CR>", { noremap = true, silent = true, desc = "View PDF" })
map("n", "<Leader>cq", ":VimtexStop<CR>", { noremap = true, silent = true, desc = "Stop VimTeX" })

map("n", "<Leader>cc", "<CMD> w | silent ! latexmk -xelatex %<CR>", { noremap = true, silent = true, desc = "Vimtex Compile" })
