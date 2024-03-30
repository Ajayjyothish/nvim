require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }


map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', {silent = true, noremap = true, desc = 'LSP Finder'})
map('n', 'M', '<cmd>Lspsaga hover_doc<CR>', {silent = true, noremap = true, desc = 'Hover Documentation'})
map('n', '<leader>cf', '<cmd>Lspsaga code_action<CR>', {silent = true, noremap = true, desc = 'Code Action'})
map('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', {silent = true, noremap = true, desc = 'Rename'})
map('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
map('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
map('v', '<leader>cf', '<cmd><C-U>Lspsaga range_code_action<CR>', opts)
map('n', '<C-m>', '<cmd>Lspsaga signature_help<CR>', opts)
map('n', 'gi', '<cmd>Lspsaga goto_definition<CR>', opts)
map('n', '<leader>o', '<cmd>Lspsaga outline<CR>', opts)
map('n', '<leader>sf', '<cmd>Lspsaga finder<CR>', opts)
map('n', '<leader>ii', '<cmd>Lspsaga incoming_calls<CR>', opts)
map('n', '<leader>io', '<cmd>Lspsaga outgoing_calls<CR>', opts)

