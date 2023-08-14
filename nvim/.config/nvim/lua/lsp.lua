local lspconfig = require('lspconfig')
local coq = require('coq')
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  -- coq.lsp_ensure_capabilities {
      settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = false
            },
            checkOnSave = {
                enable = false,
                allTargets = false,
            },
        },
      },
  -- }
}

lspconfig.pyright.setup {coq.lsp_ensure_capabilities{}}
lspconfig.clangd.setup {coq.lsp_ensure_capabilities{}}
lspconfig.gopls.setup {coq.lsp_ensure_capabilities{}}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<C-F>', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
