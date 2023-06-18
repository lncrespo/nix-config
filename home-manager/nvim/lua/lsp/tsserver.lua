require'lspconfig'.tsserver.setup{
    root_dir = function()
        return vim.fn.getcwd()
    end,

}
