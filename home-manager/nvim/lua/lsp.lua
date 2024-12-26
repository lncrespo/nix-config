local lspconfig = require'lspconfig'

lspconfig.gopls.setup{
    on_attach = function(client, bufnr)
        require'lsp_signature'.on_attach(signature_config)
    end,
}

lspconfig.ts_ls.setup{
    root_dir = function()
        return vim.fn.getcwd()
    end,
}

lspconfig.yamlls.setup{}

lspconfig.phpactor.setup{
    root_dir = function()
        return vim.fn.getcwd()
    end,
}

require'lspconfig'.terraformls.setup{
    root_dir = function()
        return vim.fn.getcwd()
    end,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { focusable = false }
)
