local lspconfig = require'lspconfig'

vim.lsp.config('gopls', {
    on_attach = function(client, bufnr)
        require'lsp_signature'.on_attach(signature_config)
    end,
})
vim.lsp.enable('gopls')

vim.lsp.config('ts_ls', {
    root_dir = function(bufnr, on_dir)
        on_dir(vim.fn.getcwd())
    end,
})
vim.lsp.enable('ts_ls')

vim.lsp.enable('yamlls')

vim.lsp.config('phpactor', {
    root_dir = function()
        return vim.fn.getcwd()
    end,
})
vim.lsp.enable('phpactor')

vim.lsp.config('terraformls', {
    root_dir = function()
        return vim.fn.getcwd()
    end,
})
vim.lsp.enable('terraformls')

vim.lsp.enable('svelte')

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { focusable = false }
)
