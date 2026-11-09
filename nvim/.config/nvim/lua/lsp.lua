vim.lsp.config('rust_analyzer', {
    settings = {
      ['rust-analyzer'] = {
        diagnostics = {
          enable = false;
        },
        checkOnSave = {
            enable = false,
            allTargets = false,
        },
        cargo = {
            allFeatures = true,
        },
      }
    }
  })
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('gopls')
vim.lsp.enable('zls')

vim.diagnostic.config({virtual_text=false})
vim.diagnostic.enable(false)

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
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<F9>', function() return vim.diagnostic.enable(true) end, opts)
    vim.keymap.set('n', '<F10>', function() return vim.diagnostic.enable(false) end, opts)
    vim.keymap.set('n', '<C-F>', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
