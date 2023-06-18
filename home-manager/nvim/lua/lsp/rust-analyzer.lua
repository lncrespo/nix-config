local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

require'lspconfig'.rust_analyzer.setup{
    on_attach = function(client, bufnr)
        require'lsp_signature'.on_attach(signature_config)
    end,
    capabilites = capabilites
}
