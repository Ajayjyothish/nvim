require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', {silent = true, noremap = true, desc = 'LSP Finder'})
map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', {silent = true, noremap = true, desc = 'Hover Documentation'})
map('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', {silent = true, noremap = true, desc = 'Code Action'})
map('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', {silent = true, noremap = true, desc = 'Rename'})
map('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
