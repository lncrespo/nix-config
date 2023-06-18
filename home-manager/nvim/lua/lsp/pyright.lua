require'lspconfig'.pyright.setup{
    root_dir = function()
        return vim.fn.getcwd()
    end,
    on_attach = function(client, bufnr)
        require'lsp_signature'.on_attach(signature_config)
    end,
}
