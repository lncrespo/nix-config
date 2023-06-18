require'lspconfig'.gopls.setup{
    on_attach = function(client, bufnr)
        require'lsp_signature'.on_attach(signature_config)
    end,
}
