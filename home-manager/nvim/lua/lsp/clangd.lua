local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.clangd.setup{
    root_dir = require'lspconfig'.util.root_pattern('Makefile', 'MAKEFILE'),
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        require'lsp_signature'.on_attach(signature_config)
    end,
}
