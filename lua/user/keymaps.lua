-- Mappings.
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
--keymap("", "<Space>", "<Nop>", opts)
--vim.g.mapleader = " "
--vim.g.maplocalleader = " "

-- Nvimtree
keymap("n", "<leader>t", ":NvimTreeToggle<cr>", opts)

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- keymap('n', '<space>e', vim.diagnostic.open_float, opts)
-- keymap('n', '[d', vim.diagnostic.goto_prev, opts)
-- keymap('n', ']d', vim.diagnostic.goto_next, opts)
-- keymap('n', '<space>q', vim.diagnostic.setloclist, opts)


--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})