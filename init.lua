-- https://neovim.io/doc/user/lua.html

-- disable netrw at the very start of your init.lua (strongly advised) [from nvim-tree]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("user.plugins")

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "rust_analyzer" }
})

-- https://github.com/neovim/nvim-lspconfig#quickstart
require('lspconfig').pyright.setup{}
require('lsp-status').register_progress()

require("nvim-tree").setup()
require("telescope").setup()
require('lualine').setup()
require("lsp-format").setup {}

require("user.rust")
require("user.treesitter")
require("user.options")
require("user.keymaps")
require("user.statusline")
require("user.completion")

-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])


--neovide settings
vim.api.nvim_set_var("neovide_cursor_animation_length", 0.01)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local on_attach_format = function(client, bufnr)
  on_attach(client, bufnr)
  -- enable lsp-format
  require("lsp-format").on_attach(client)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
--require('lspconfig')['pyright'].setup{
--    on_attach = on_attach,
--    flags = lsp_flags,
--}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    enable_editorconfig_support = true,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach_format,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}